import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Batches.dart';
import 'package:flutter_application_1/pages/Homepage_admin.dart';
import 'package:flutter_application_1/pages/Homepage_user.dart';
import 'package:flutter_application_1/pages/Login_page.dart';
import 'package:flutter_application_1/pages/Registration_page.dart';
import 'package:flutter_application_1/pages/table.dart';
//commenting

//import 'package:flutter_application_1/practice.dart';
//import 'googleFonts.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// harshal's commit

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme:ThemeData(primarySwatch: Colors.blue),

      routes: {
       "/" :(context)=> LoginPage(),

        "/Login":(context)=>LoginPage(),
      },
    );
  }
}

// code commited