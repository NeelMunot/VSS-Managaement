import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class MyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holiday Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<DateTime> holidayDates = [
    DateTime.utc(2023, 3, 1),
    DateTime.utc(2023, 3, 17),
    DateTime.utc(2023, 3, 25),
    // Add more holiday dates as needed
  ];

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holiday Calendar'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2023, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          selectedBuilder: (context, date, _) {
            return _buildCell(date, Colors.blue);
          },
          todayBuilder: (context, date, _) {
            return _buildCell(date, Colors.red);
          },
          markerBuilder: (context, date, events) {
            if (_isHoliday(date)) {
              return _buildHolidayMarker();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  bool _isHoliday(DateTime date) {
    return holidayDates.contains(date);
  }

  Widget _buildCell(DateTime date, Color color) {
    bool isHoliday = _isHoliday(date);

    return Container(
      decoration: BoxDecoration(
        color: isHoliday ? color : null,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '${date.day}',
          style: TextStyle(
            color: isHoliday ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidayMarker() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Highlighted Calendar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Calendar(),
//     );
//   }
// }
//
// // class CalendarScreen extends StatefulWidget {
// //   @override
// //   _CalendarScreenState createState() => _CalendarScreenState();
// // }
//
// class Calendar extends StatefulWidget {
//   const Calendar({
//     required this.toHighlight,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _CalendarState createState() => _CalendarState();
//
//   final List<DateTime> toHighlight;
// }
//
// class _CalendarState extends State<Calendar> {
//   //DateTime toHighlight = DateTime.now().subtract(Duration(days: 2)); // Example highlighted date
//
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Highlighted Calendar'),
//       ),
//       body: TableCalendar(
//         firstDay: DateTime.utc(2023, 1, 1),
//         lastDay: DateTime.utc(2023, 12, 31),
//         focusedDay: _focusedDay,
//         calendarFormat: _calendarFormat,
//         onFormatChanged: (format) {
//           setState(() {
//             _calendarFormat = format;
//           });
//         },
//         onPageChanged: (focusedDay) {
//           setState(() {
//             _focusedDay = focusedDay;
//           });
//         },
//     calendarBuilders: CalendarBuilders(
//     defaultBuilder: (context, day, focusedDay) {
//     for (DateTime d in widget.toHighlight) {
//     if (day.day == d.day &&
//     day.month == d.month &&
//     day.year == d.year) {
//     return Container(
//     decoration: const BoxDecoration(
//     color: Colors.lightGreen,
//     borderRadius: BorderRadius.all(
//     Radius.circular(8.0),
//     ),
//     ),
//     child: Center(
//     child: Text(
//     '${day.day}',
//     style: const TextStyle(color: Colors.white),
//     ),
//     ),
//     );
//     }
//     }
//     return null;
//     },
//     )));

//   Widget _buildCell(DateTime date, Color color) {
//     return Container(
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: Text(
//           '${date.day}',
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Highlighted Datepicker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DatepickerScreen(),
//     );
//   }
// }
//
// class DatepickerScreen extends StatefulWidget {
//   @override
//   _DatepickerScreenState createState() => _DatepickerScreenState();
// }
//
// class _DatepickerScreenState extends State<DatepickerScreen> {
//   List<DateTime> _holidays = [
//     DateTime(2023, 1, 1),
//     DateTime(2023, 12, 25),
//     DateTime(2023, 7, 4),
//   ];
//
//   List<DateTime> _weekends = [
//     DateTime(2023, 5, 13),
//     DateTime(2023, 5, 14),
//     DateTime(2023, 5, 20),
//     DateTime(2023, 5, 21),
//     DateTime(2023, 5, 27),
//     DateTime(2023, 5, 28),
//   ];
//
//   DateTime _selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Highlighted Datepicker'),
//       ),
//       body: SfDateRangePicker(
//         onSelectionChanged: _onSelectionChanged,
//         monthCellStyle: DateRangePickerMonthCellStyle(
//           cellBuilder: (BuildContext context, DateRangePickerCellDetails cellDetails) {
//             final date = cellDetails.date;
//             final isHoliday = _holidays.contains(date);
//             final isWeekend = _weekends.contains(date);
//
//             return Container(
//               color: isHoliday ? Colors.red : isWeekend ? Colors.yellow : null,
//               child: Center(
//                 child: Text(
//                   '${date.day}',
//                   style: TextStyle(
//                     color: isHoliday || isWeekend ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     setState(() {
//       _selectedDate = args.value;
//     });
//
//     print('Selected date: $_selectedDate');
//   }
// }
//