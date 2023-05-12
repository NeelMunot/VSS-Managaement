// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Backend.dart';
// void main(){
//   runApp(
//       MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home:MyTable()

//       )
//   );
// }
// class MyTable extends StatefulWidget {
//   @override
//   _MyTableState createState() => _MyTableState();
// }

// class _MyTableState extends State<MyTable> {
  
//   // List<String> grnlist=[];
//   // void getbatch() async
//   // {
//   // await Batches.get_batches("B1");
//   // Map<String,String> batch=Batches.cur_batch;
//   // grnlist=batch.values.toList();

//   // }
  
//   //GRN Number
  
//   List<int> numbers = [11, 2, 3, 4, 5, 6, 7];
//   //name
//   List<String> names = ['', '', '', '', '', '', ''];
//   //checkboxes
//   List<bool> isPresent = [false, false, false, false, false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Attendance"),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: DataTable(
//             columns: [
//               DataColumn(label: Text(' GRN Number')),
//               DataColumn(label: Text('Name')),
//               DataColumn(label: Text('Absent')),
//             ],
//             rows: List<DataRow>.generate(
//               numbers.length,
//                   (index) => DataRow(
//                 cells: [
//                   DataCell(
//                     TextFormField(
//                       initialValue: numbers[index].toString(),
//                       keyboardType: TextInputType.number,
//                       //validatory condition for number field
//                       onChanged: (value) {
//                         setState(() {
//                           numbers[index] = int.parse(value);
//                         });
//                       },
//                     ),
//                   ),
//                   DataCell(
//                     TextFormField(
//                       initialValue: names[index],
//                       //validatory condition for name field
//                       onChanged: (value) {
//                         setState(() {
//                           names[index] = value;
//                         });
//                       },
//                     ),
//                   ),
//                   DataCell(
//                     Checkbox(
//                       value: isPresent[index],
//                       //validtory condition for checkboxes
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isPresent[index] = value ?? false;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
            onChanged: (newValue) {
              setState(() {
                _checkedItems[index] = true;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_checkedItems);
        },
        child: Icon(Icons.check),
     ),
);
}
}
