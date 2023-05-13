import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';


class MyTable extends StatelessWidget {
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
Map<String,String> batch={};
List<String> Present=[];
List<String> Name=[];
List<String> Grn=[];
String batch_name="";
  
  void getdata()async{
    
  await ref.child("Teacher/${UserData.Cur_Grn}").onValue.first.then((event) {
                batch_name = event.snapshot.value.toString();
            });

  await Batches.get_batches(batch_name);
  batch=Batches.cur_batch;
  Grn=batch.keys.toList();
  Name=batch.values.toList();

  }
  //var Name = ['Mohit', 'Neel', 'Piyanshu', 'Yogu', 'Korade'];
  //var Grn = ['1','2','3','4','5'];
    
  @override
  Widget build(BuildContext context) {
    getdata();
    print(Name);
    print(Grn);
  List<bool> _checkedItems = List.generate(Grn.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark The Attendance'),
      ),
      body: ListView.builder(
        itemCount: _checkedItems.length,
        itemBuilder: (context, index) {
          
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
            },


          );
        },
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
