import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Backend.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    // Check if credentials are stored in secure storage
    String? username = await storage.read(key: 'username');
    String? password = await storage.read(key: 'password');
    String? role = await storage.read(key: 'role');
    String? grn = await storage.read(key: 'grn');

    if (username != null && password != null) {
          await UserData.checkdata(grn!);
          UserData.role=role!;
      // Credentials found, automatically log in and redirect to home page
      // Perform your authentication logic here

      // Redirect to home page
      _auth.signInWithEmailAndPassword(email: username, password: password);
      Navigator.pushReplacementNamed(context, '/home');

    }
    else
    {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
