import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';
import 'package:intl/intl.dart';

class Demotable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mark The Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> batch = {};
  List<String> Present = [];
  List<String> Name = [];
  List<String> Grn = [];
  String batch_name = "";
  var batchref=FirebaseDatabase.instance.ref("Batches/B1");

  void getdata() async {
    await ref.child("Teacher/M23240001").onValue.first.then((event) {
      batch_name = event.snapshot.value.toString();
      batch_name="B1";
      print("batch="+batch_name);
    });

    await Batches.get_batches(batch_name);
    print(batch_name);
    batch = Batches.cur_batch;
    Grn = batch.keys.toList();
    Name = batch.values.toList();
  }
  //var Name = ['Mohit', 'Neel', 'Piyanshu', 'Yogu', 'Korade'];
  //var Grn = ['1','2','3','4','5'];

  @override
  Widget build(BuildContext context) {
    //getdata();
    print(batch_name);
    print("Name=$Name");
    print("GRN=$Grn");
    List<bool> _checkedItems = List.generate(Grn.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark The Attendance'),
      ),
    
      body:
SafeArea(
  child: Column(
    children:[
StreamBuilder(
  stream: ref.child("Batches/B1").onValue,
  builder: (context,snapshot) {
    if (snapshot.hasData) {
      print(snapshot);
      Map<String,dynamic> batchdata =( snapshot.data!.snapshot.value as Map<Object?,Object?> ).map((key, value) => MapEntry(key.toString(), value.toString()));
      if (batchdata != null) {
        print(batchdata.keys.toString());
          List<String> Name =batchdata.keys.toList();
          List<dynamic> Grn = batchdata.values.toList();


      return Expanded(
        child: ListView.builder(
          itemCount:batchdata.keys.length ,
          itemBuilder: (context, index){
      
            return ListTile(
                title: Text(Name[index]),
                subtitle: Text(Grn[index]),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
            );
            
          },
          ),
      );




        //return Text(batchdata.keys.toString()+batchdata.keys.length.toString());
      }
    }
    else{
    return Text('Loading...1');
    }

    return Text("nothing to look here");
  },
),
  ]
  ),
),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Attendance.markAttendance("B1", Present);
        },
        child: Icon(Icons.check),
      ),
    


    );
  }
}
