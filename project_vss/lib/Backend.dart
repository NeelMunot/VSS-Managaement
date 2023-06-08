import 'dart:async';
import 'dart:io';
import 'package:VSS/pages/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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

                  Navigator.pushAndRemoveUntil(
                  context,MaterialPageRoute(builder: (context) => SplashScreen()),
                  (Route<dynamic> route) => false, // Remove all previous routes
                  );
                } 
                else if(Message.contains("Attendence")) {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, "/home");
                }
                else if(Message.contains("Batch Changed") || Message.contains("alloted to")) {
                  Navigator.pushAndRemoveUntil(
                  context,MaterialPageRoute(builder: (context) => SplashScreen()),
                  (Route<dynamic> route) => false, // Remove all previous routes
                  );
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
  }
}

class Batches {
  static String Alloted_batch = "";

  static set_batch(String New_Batch) async {
    int Batch_count = -1;
    int Old_Batch_count = -1;
    String? name = UserData.User_data["name"];
    String? Old_Batch = UserData.User_data["Batch"];
    
    await ref.child("Counters/$New_Batch").onValue.first.then((event) {
      Batch_count = int.parse(event.snapshot.value.toString());
    });
    await ref.child("Counters/$Old_Batch").onValue.first.then((event) {
      Old_Batch_count = int.parse(event.snapshot.value.toString());
    });

    await ref.child("Batches/$New_Batch/${UserData.Cur_Grn}").set(name);
    await ref.child("Counters/$New_Batch").set(Batch_count + 1);
    await ref.child("Counters/$Old_Batch").set(Old_Batch_count - 1);

    await ref.child("Batches/$Old_Batch/${UserData.Cur_Grn}").remove().then((_) {
      print("Batch Changed Successfully");
    }).catchError((error) {
      print("Failed !!: $error");
    });

    await ref.child("users/${UserData.Cur_Grn}/Batch").set(New_Batch);
    
  }
  static set_admin_batch(String NewBatch) async{

    await ref.child("Teachers/${UserData.Cur_Grn}").set(NewBatch);
    print("New bath now is $NewBatch");
  }
  static get_alloted_batch() async {
    await ref.child("Teachers/${UserData.Cur_Grn}").onValue.first.then((event) {
      Alloted_batch = event.snapshot.value.toString();
      print("Alloted_batch is $Alloted_batch");
    });
  }
}

class Attendance extends UserData {
  //will receive list of Grn nos.
  static markAttendance(String Batch, List<String> Grns) async {
    String cur_date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    await ref.child("Attendance/$cur_date/$Batch").set(Grns);
  }
}
