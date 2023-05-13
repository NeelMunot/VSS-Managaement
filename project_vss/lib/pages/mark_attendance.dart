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
List<String> arrN=[];
List<String> prn=[];
  void getdata()async{
  await Batches.get_batches("B1");
  batch=Batches.cur_batch;
  //print(batch);
  prn=batch.keys.toList();
  arrN=batch.values.toList();
  }
  //var arrN = ['Mohit', 'Neel', 'Piyanshu', 'Yogu', 'Korade'];
  //var prn = ['1','2','3','4','5'];
    
  @override
  Widget build(BuildContext context) {
    getdata();
    print(arrN);
    print(prn);
  List<bool> _checkedItems = List.generate(prn.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark The Attendance'),
      ),
      body: ListView.builder(
        itemCount: _checkedItems.length,
        itemBuilder: (context, index) {
          
          return CheckboxListTile(
            title: Text(arrN[index]),
            subtitle: Text(prn[index]),
            value: _checkedItems[index],
            onChanged: (value) {
                  setState(() {
                    _checkedItems[index] = value!;
                    if (value) {
                          Present.add(prn[index]);
                      } else {
                        Present.remove(prn[index]);
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
