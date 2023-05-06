import 'dart:ffi';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/pages/loginpage.dart';

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
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final ref = FirebaseDatabase.instance.ref();
  static Map<String,String> data={};

  static Future<void>? checkdata(String Grn_No) async
  {
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
    }

  else
    {
    data={};
    }

    });
  }

}