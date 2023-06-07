import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:VSS/Backend.dart';
import 'package:VSS/pages/Homepage_admin.dart';
import 'package:VSS/pages/Homepage_user.dart';
import 'package:VSS/pages/Login_page.dart';
import 'package:VSS/pages/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.blue),
    routes: {
  "/": (context) => SplashScreen(),
  "/login": (context) => LoginPage(),
  "/home": (context) {
    // Checks the user role here and return the appropriate page
    if (UserData.role=="student") {
      return Homepage_user();
    } else {
      return Homepage_admin();
    }
  },
},
    );
  }
}

// code commited
