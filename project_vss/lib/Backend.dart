import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login_page.dart';
import 'main.dart';
import 'package:intl/intl.dart';

final ref = FirebaseDatabase.instance.ref();
final FirebaseAuth _auth = FirebaseAuth.instance;


class GRN
{
static RegExp Grn_format = RegExp(r'^(m|f|M|F)\d{8}$', caseSensitive: false);
static String generateGrn(String gender, int count)
{
int cur_year = (DateTime.now().year % 100);
int ac_year =((cur_year*100)+cur_year+1)*10000;
String Grn = gender+(ac_year+count).toString();
return Grn;
}

static bool validateGrn(String GRN)
{
  return Grn_format.hasMatch(GRN);
}

}


class popups
{
static void showMessage(BuildContext context,String Message) {
  Icon icn=Icon(Icons.close);
  if(Message.contains("Loggin in"))
  {
      icn==Icon(Icons.login);
  }
  if(Message.contains("Not Verified"))
  {
    icn=Icon(Icons.verified_user);
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
            onPressed: (){
                            
              if(Message.contains("Logging in"))
              {Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
              );
              }
              if(Message.contains("not Verified"))
              {Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => LoginPage()),
              );
              }
              else{
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

class UserData
{

  static Map<String,String> data={};
  static String Cur_Grn="";

  static Future<void>? checkdata(String Grn_No) async
  {
  data={};
  Query query=ref.child("users/$Grn_No");
  await query.onValue.first.then((event) {
  var snapshot = event.snapshot;

  if (snapshot.value != null) 
    {
    var dataset = snapshot.value;
    dataset as Map<Object?, Object?>;
    data = dataset.map((key, value) =>
  MapEntry(key.toString(), value.toString())
    );
    print(dataset.runtimeType); 
    Cur_Grn=Grn_No;
    }

  else
    {
    data={};
    Cur_Grn="";
    }

    });
  }

}

class Batches
{
  static Map<String,String> cur_batch={};

  static set_batch(String Grn,String Batch) async
  {
  await ref.child("Users/$Grn").set({"Batch":Batch});
  int Batch_count=-1;
      await ref.child("Counters/$Batch").onValue.first.then((event) {
           Batch_count = int.parse(event.snapshot.value.toString());
           });
  await ref.child("Batches/$Batch").set({Grn:Batch_count});
  await ref.child("Counters/$Batch").set(Batch_count+1);
  }

   static get_batches(String Batch) async
  {   cur_batch={};

      Query query=ref.child("Batches/$Batch");
      await query.onValue.first.then((event) {
      var snapshot = event.snapshot;

      if (snapshot.value != null) 
        {
        var dataset = snapshot.value;
        dataset as Map<Object?, Object?>;
        cur_batch = dataset.map( (key, value) => MapEntry(value.toString(),key.toString()) );
        }
        });
  }

}

// class Attendance extends UserData
// {
//   //will receive list of Grn nos.
//   static markAttendance(String Batch,List<String> Grns) async
//   {
//     String ddmm=DateTime.now().day.toString()+"-"+ DateTime.now().month.toString();
//     String yy=DateTime.now().year.toString();

//     await ref.child("Attendance/$yy/$ddmm/$Batch").set(Grns);
//   }
//   static get_attendance(String cur_month)
//   {

//   }
// }