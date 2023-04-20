import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/pages/loginpage.dart';

import 'pages/homePage.dart';
import 'pages/registration.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
