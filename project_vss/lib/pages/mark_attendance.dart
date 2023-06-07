//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:VSS/Backend.dart';
//import 'package:intl/intl.dart';

class Mark_Attd extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Mark_Attd> {
  Map<String, String> batch = {};
  List<String> Name = [];
  List<String> Grn = [];
  String batch_name = "";
  List<bool> _checkedItems =[];
  List<String> Present=[];

  //var Name = ['Mohit', 'Neel', 'Piyanshu', 'Yogu', 'Korade'];
  //var Grn = ['1','2','3','4','5'];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Mark Attendance( ${Batches.Alloted_batch} )'),
          ),
        
          body:
SafeArea(
  child: Column(
        children:[
StreamBuilder(
  stream: ref.child("Batches/${Batches.Alloted_batch}").onValue,
  builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.active)
        {
        if (snapshot.hasData) {
          if (snapshot.data!.snapshot.value!=null) {
          Map<String,dynamic> batchdata =( snapshot.data!.snapshot.value as Map<Object?,Object?> ).map((key, value) => MapEntry(key.toString(), value.toString()));
              List<dynamic> Name =batchdata.values.toList();
              List<String> Grn = batchdata.keys.toList();
              if (_checkedItems.isEmpty) {
                  _checkedItems = List.generate(Grn.length, (index) => false);
                }


          return Expanded(
            child: ListView.builder(
              itemCount:batchdata.keys.length ,
              itemBuilder: (context, index){
          
                return CheckboxListTile(
                title: Text(Name[index]),
                subtitle: Text(Grn[index]),
                value: _checkedItems[index],
                onChanged: (value) {
                  setState(() {
                    _checkedItems[index] = value!;
                    if (value) {
                      Present.add(Grn[index]);
                    } else {
                      Present.remove(Grn[index]);
                    }
                  });
                  print("presents== $Present");
                },
              );
                
              },
              ),
          );
          }
          else{
            return Text("Batch data is empty");
          }
        }
  }
  else{
        return Center(
          child: CircularProgressIndicator(),
        );
        }

  return Text("Please Try again Later.....");
  },
),
  ]
  ),
),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Attendance.markAttendance(Batches.Alloted_batch, Present);
              popups.showMessage(context, "Attendence of ${Present.length} students is marked");
            },
            child: Icon(Icons.check),
          ),
        


        );
      }
    );
  }
}
