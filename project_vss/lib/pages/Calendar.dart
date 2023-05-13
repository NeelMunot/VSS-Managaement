import 'package:flutter/material.dart';
import 'package:flutter_application_1/Backend.dart';
import 'package:table_calendar/table_calendar.dart';

void getdates() async
{await Attendance.get_attendance();}

class Mycalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   getdates();
    return MaterialApp(
      title: 'Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calendar(toHighlight:toHighlight),
    );
  }
}

List<DateTime> toHighlight = Attendance.Absent_days;

class Calendar extends StatefulWidget {
  const Calendar({
    required this.toHighlight,
    Key? key,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();

  final List<DateTime> toHighlight;
}

class _CalendarState extends State<Calendar> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text('Attendance'),
        ),
        body: TableCalendar(
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
                for (DateTime d in widget.toHighlight) {
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
            )));
  }}