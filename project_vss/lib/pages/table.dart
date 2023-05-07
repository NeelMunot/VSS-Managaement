import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';
void main(){
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home:MyTable()

      )
  );
}
class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  
  //Map<String,String> batch =Batches.get_batches("B1");

  //GRN Number
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7];
  //name
  List<String> names = ['', '', '', '', '', '', ''];
  //checkboxes
  List<bool> isPresent = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text(' GRN Number')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Absent')),
            ],
            rows: List<DataRow>.generate(
              numbers.length,
                  (index) => DataRow(
                cells: [
                  DataCell(
                    TextFormField(
                      initialValue: numbers[index].toString(),
                      keyboardType: TextInputType.number,
                      //validatory condition for number field
                      onChanged: (value) {
                        setState(() {
                          numbers[index] = int.parse(value);
                        });
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      initialValue: names[index],
                      //validatory condition for name field
                      onChanged: (value) {
                        setState(() {
                          names[index] = value;
                        });
                      },
                    ),
                  ),
                  DataCell(
                    Checkbox(
                      value: isPresent[index],
                      //validtory condition for checkboxes
                      onChanged: (bool? value) {
                        setState(() {
                          isPresent[index] = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}