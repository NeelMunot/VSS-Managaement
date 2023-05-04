import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePage.dart';
import 'package:flutter_application_1/pages/registration.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController GRN_NOcontroller =TextEditingController();
TextEditingController passwordcontroller =TextEditingController();

    final FirebaseAuth _auth = FirebaseAuth.instance;
    final ref = FirebaseDatabase.instance.ref();


void login() async{

    // basic operations
  // print("doing this 1st");
  // final query=ref.child("users").orderByChild("Course").equalTo("qq");
  //     await query.onValue.first.then((event) {
  //     String dats = event.snapshot.value.toString();
  //      print("doing this 2nd");
  //      print(dats);
  //     });


  String GRN=GRN_NOcontroller.text.trim();
  String PWD=passwordcontroller.text.trim();
  String paths="users/"+GRN+"/Email";
    String email="";
    if(EmailValidator.validate(GRN))
    {
      UserCredential usercredential = await _auth.signInWithEmailAndPassword(email: GRN, password: PWD);
      print("done with email");
    }
    else if(GRN=="")
    {
      print("NULL userid");
    }
    else 
    {
      await ref.child(paths).onValue.first.then((event) {
      email = event.snapshot.value.toString();
      });
      print("email is "+email);
      UserCredential usercredential = await _auth.signInWithEmailAndPassword(email: email, password: PWD);
      print("Done with GRN");
      print("SIGN iN Done");
    }



bool isverified=false;
isverified=_auth.currentUser!.emailVerified;
print("verification status=");
print(isverified);
if(!isverified)
{
  User? user = _auth.currentUser;
  user?.sendEmailVerification();
}


}

  bool visiblePassword = false;
  String name = "";
  final _formKey = GlobalKey<FormState>();
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text("Welcome",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: GRN_NOcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter GRN No.",
                        labelText: " GRN No.",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the GRN no.';
                        };
                      },
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      obscureText: visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visiblePassword = !visiblePassword;
                              });
                            },
                            icon: Icon(visiblePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length < 8) {
                          return 'password should have 8 places';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              print("forgot password");
                            },
                            child: Text("Forgot Password ?"))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //login();
                        //print(uid);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyWidget()),
                        );
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(minimumSize: Size(250, 40)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("New to this app?"),
                        
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyForm()),
                              );
                            },
                            child: Text("Sign Up"))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
