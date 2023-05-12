import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/Backend.dart';
    Map<String,String> data=UserData.data;
    final ref = FirebaseDatabase.instance.ref();
  String user_batch="";
  void dispdata() async{
        String user_batch = data['Batch']!;
        await ref.child("Attendance/$user_batch").onValue.first.then((event) {
           var dataset = event.snapshot.value;
            dataset as Map<Object?, Object?>;
            data = dataset.map(
              (key, value) => MapEntry(key.toString(), value.toString())
            );
            print(data); 

           });

  }
void main()async{
  List<String> prn=[];
  await Batches.get_batches("B1");
Map<String,String> batch=Batches.cur_batch;
  print(batch);
  prn=batch.keys.toList();
  print(prn);
//dispdata();
}