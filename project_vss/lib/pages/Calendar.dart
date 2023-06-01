import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';
import 'package:table_calendar/table_calendar.dart';

class Mycalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calendar(),
    );
  }
}


class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();

}

class _CalendarState extends State<Calendar> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  List<DateTime> toHighlight=[];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text('Attendance'),
        ),
        body: 
        
SafeArea(
  child: Column(
    children:[
StreamBuilder(
  stream: ref.child("Attendance/${UserData.User_data["Batch"]}").onValue,
  builder: (context,snapshot) {
    toHighlight=[];
    if(snapshot.connectionState==ConnectionState.active)
    {
    if (snapshot.hasData) {
      if (snapshot.data!.snapshot.value!=null) {
      Map<String,String> alldates =( snapshot.data!.snapshot.value as Map<Object?,Object?> ).map((key, value) => MapEntry(key.toString(), value.toString()));

        for (var item in alldates.entries) {
        String date = item.key;
        if (item.value.contains(UserData.Cur_Grn) == false & (toHighlight.contains(DateTime.parse(date)) == false) ) {
          toHighlight.add(DateTime.parse(date));
        }
      }
      return Expanded(
        
        child: TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                for (DateTime d in toHighlight) {
                  if (day.day == d.day &&
                      day.month == d.month &&
                      day.year == d.year) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                }
                return null;
              },
            ))
      );
      }
      else{
        return Text("No Attendence  is Taken yet...");
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
  )                  
);
}}