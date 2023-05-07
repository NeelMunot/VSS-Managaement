import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
    }

    });
  }

}

class Batches
{
  static Map<String,String> batch={};

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
  {   batch={};

      Query query=ref.child("Batches/$Batch");
      await query.onValue.first.then((event) {
      var snapshot = event.snapshot;

      if (snapshot.value != null) 
        {
        var dataset = snapshot.value;
        dataset as Map<Object?, Object?>;
        batch = dataset.map( (key, value) => MapEntry(value.toString(),key.toString()) );
        }
        });
  }

}

// class Attendance
// {
//   //will receive list of Grn nos.
//   static markAttendance(List<String> Grns)
//   {
//     for(String i in Grns)
//     {
      
//     }
//   }
// }