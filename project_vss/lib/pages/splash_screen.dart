import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VSS/Backend.dart';

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

    if (username != "" && username != null) {

          await UserData.checkdata(grn!);
          UserData.role=role!;
          if(role=="Teacher"){
          await Batches.get_alloted_batch();
          }
          try{
                _auth.signInWithEmailAndPassword(email: username.toString(), password: password.toString());
                Navigator.pushReplacementNamed(context, '/home');
              }on FirebaseAuthException catch (e)
                {
                    {
                        if(e.code=='wrong-password')
                          {
                            popups.showMessage(context,"Invalid Password !!");
                          }
                        else
                          {
                            popups.showMessage(context,e.message.toString());
        
                          }
                    }
                }

    }
    else{
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
