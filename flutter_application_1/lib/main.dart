import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/loginpage.dart';

import 'pages/homePage.dart';
import 'pages/registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // "/": (context) => MyWidget(),
        "/": (context) => MyForm(),
        // "/": (context) => LoginPage(),
      },
    );
  }
}
