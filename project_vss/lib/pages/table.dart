import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';
import 'package:intl/intl.dart';

class dispattd extends StatelessWidget {
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
  List<String> Presents=[];
  List<bool> _checkedItems = List.generate(5, (index) => false);
  var arrN = ['Mohit', 'Neel', 'Piyanshu', 'Yogu', 'Korade'];
  var prn = ['1','2','3','4','5'];
  @override
  Widget build(BuildContext context) {
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
                          Presents.add(prn[index]);
                      } else {
                        Presents.remove(prn[index]);
                      }
                  });
            },

            
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_checkedItems);
          print(Presents);
        },
        child: Icon(Icons.check),
     ),
);
}
}
