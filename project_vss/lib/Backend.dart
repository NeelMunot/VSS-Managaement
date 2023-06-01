import 'dart:async';
import 'dart:ffi';
//import 'dart:js_util';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:VSS/pages/Login_page.dart';
import 'main.dart';
import 'package:intl/intl.dart';

final ref = FirebaseDatabase.instance.ref();
final FirebaseAuth _auth = FirebaseAuth.instance;

class GRN {
  static RegExp Grn_format = RegExp(r'^(m|f|M|F)\d{8}$', caseSensitive: false);
  static String generateGrn(String gender, int count) {
    int cur_year = (DateTime.now().year % 100);
    int ac_year = ((cur_year * 100) + cur_year + 1) * 10000;
    String Grn = gender + (ac_year + count).toString();
    return Grn;
  }

  static bool validateGrn(String GRN) {
    return Grn_format.hasMatch(GRN);
  }
}

class popups {
  static showMessage(BuildContext context, String Message) {
    Icon icn = Icon(Icons.close);
    if (Message.contains("Logging in")) {
      icn == Icon(Icons.login);
    } else if (Message.contains("not verified")) {
      icn = Icon(Icons.verified_user);
    } else {
      icn = Icon(Icons.close);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Message"),
          content: Text(Message),
          actions: [
            IconButton(
              icon: icn,
              onPressed: () {
                if (Message.contains("Logging in") ||
                    Message.contains("not verified")) {

                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, "/login");
                } 
                else if(Message.contains("Attendence")) {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, "/home");
                }
                else
                {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class UserData {
  static String role="student";
  static Map<String, String> User_data = {};
  static String Cur_Grn = "";

  static Future<void>? checkdata(String Grn_No) async {
    User_data = {};
    Query query = ref.child("users/$Grn_No/");
    await query.onValue.first.then((event) {
      var snapshot = event.snapshot;

      if (snapshot.value != null) {
        var dataset = snapshot.value;
        dataset as Map<Object?, Object?>;
        User_data = dataset
            .map((key, value) => MapEntry(key.toString(), value.toString()));
        print(dataset.runtimeType);
        Cur_Grn = Grn_No;

      } else {
        User_data = {};
        Cur_Grn = "";
      }
    });
    print("Batch of user is is ");
    print(User_data["Batch"]);
  }
}

class Batches {
  static String Alloted_batch = "";

  static set_batch(String Grn, String New_Batch) async {
    int Batch_count = -1;
    int Old_Batch_count = -1;
    String name = "";
    String Old_Batch = "";
    await ref.child("Counters/$New_Batch").onValue.first.then((event) {
      Batch_count = int.parse(event.snapshot.value.toString());
    });
    await ref.child("users/$Grn/name").onValue.first.then((event) {
      name = event.snapshot.value.toString();
    });
    await ref.child("Counters/$Old_Batch").onValue.first.then((event) {
      Old_Batch_count = int.parse(event.snapshot.value.toString());
    });
    await ref.child("users/$Grn/Batch").onValue.first.then((event) {
      Old_Batch = event.snapshot.value.toString();
    });

    await ref.child("Batches/$New_Batch").set({Grn: name});
    await ref.child("Counters/$New_Batch").set(Batch_count + 1);
    await ref.child("Counters/$Old_Batch").set(Old_Batch_count - 1);

    await ref.child("Batches/$Grn").remove().then((_) {
      print("Batch Changed Successfully");
    }).catchError((error) {
      print("Failed !!: $error");
    });

    await ref.child("Users/$Grn").set({"Batch": New_Batch});
  }

  static get_batches() async {
    await ref.child("Teachers/${UserData.Cur_Grn}").onValue.first.then((event) {
      Alloted_batch = event.snapshot.value.toString();
      print(Alloted_batch);
    });
  }
}

class Attendance extends UserData {
  static List<DateTime> Total_days = [];
  static List<DateTime> Absent_days = [];

  //will receive list of Grn nos.
  static markAttendance(String Batch, List<String> Grns) async {
    String cur_date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    await ref.child("Attendance/$Batch/$cur_date").set(Grns);
  }
}
