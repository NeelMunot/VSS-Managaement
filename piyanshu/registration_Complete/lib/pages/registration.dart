import 'dart:async';
import 'dart:math';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Backend.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyForm extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
    return MyFormState();
  }
}

// class MyApp extends StatefulWidget {
// @override
// _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
// final _form = GlobalKey<FormState>();
// String title ="";
// void writeData() async {
// 	_form.currentState.save();
//   var url = "https://vss-application-default-rtdb.firebaseio.com/"+"data.json";
//   try {
// 	final response = await http.post(
// 		Uri.parse(url),
// 		body: json.encode({"Name": title}),
// 	);
// 	} catch (error) {
// 	throw error;
// 	}
// }
// }
DatabaseReference ref = FirebaseDatabase.instance.ref();

class MyFormState extends State<MyForm>{
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final GRN_NOController = TextEditingController();
  final passwordController = TextEditingController();
  final courseController = TextEditingController();
  final schoolnController = TextEditingController();
  final schoolmController = TextEditingController();
  final collegenController = TextEditingController();
  final collegemController = TextEditingController();
  final EmailController = TextEditingController();
  final CodeController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  void dispose(){
    nameController.dispose();
    phoneController.dispose();
    GRN_NOController.dispose();
    courseController.dispose();
    passwordController.dispose();
    schoolnController.dispose();
    schoolmController.dispose();
    collegenController.dispose();
    collegemController.dispose();
    EmailController.dispose();
    CodeController.dispose();
    
    super.dispose();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Registration Page"),),

      body: Container(

padding:EdgeInsets.symmetric(vertical:25.0,horizontal:20.0),
child:SingleChildScrollView(
    child:Form(
          child:Column(
            children:<Widget> [

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  
                  hintText: "Enter Your Name",
                    border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.0)
          )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter Your Phone number",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter phone number";
                  }
                  else if(value.length<10 || value.length<10){
                    return "Enter valid number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),
              TextFormField(
                controller: EmailController,
                decoration: InputDecoration(
                    labelText: "Email ",
                    hintText: "Enter Your Email ",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter Email ";
                  }

                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),              
              TextFormField(
                controller: CodeController,
                decoration: InputDecoration(
                    labelText: "Code ",
                    hintText: "Enter Your Code",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter Code ";
                  }

                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: " Password",
                    hintText: "Create new password",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter password";
                  }
                  else if(value.length<8){
                    return "password should have 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: courseController,
                decoration: InputDecoration(
                    labelText: " current course",
                    hintText: "Enter Your current course",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter current course";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: schoolnController,
                decoration: InputDecoration(
                    labelText: " School Name",
                    hintText: "Enter Your  School Name",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter school name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: collegenController,
                decoration: InputDecoration(
                    labelText: " College Name",
                    hintText: "Enter Your  College Name",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter college name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: schoolmController,
                decoration: InputDecoration(
                    labelText: " SSC Marks",
                    hintText: "Enter Your  SSC Marks",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),validator: (value){
                if(value==null|| value.isEmpty){
                  return "please enter SSC marks";
                }
                else if(value.characters==true){
                  return "Enter correct marks";
                }
                return null;
              },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                controller: collegemController,
                decoration: InputDecoration(
                    labelText: " HSC Marks",
                    hintText: "Enter Your  HSC Marks",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter HSC marks ";
                  }
                  else if(value.characters==true){
                    return "Enter correct Marks";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              ElevatedButton(onPressed:  () async{

                String Email=EmailController.text.trim();
                int User_Count=-1;
                await ref.child("User_Count").onValue.first.then((event) {
                User_Count = int.parse(event.snapshot.value.toString());
                });
                String Grn_No=GRN.generateGrn("M",User_Count);
                String password=passwordController.text.trim();


                if(EmailValidator.validate(Email))
                {
                  try{
                UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: Email,password: password);
                await ref.child("User_count").set(User_Count+1);
                String? uid=userCredential.user?.uid;
                await ref.child("users/$Grn_No").set({
                  "name": nameController.text.trim(),
                  "Phone Number": phoneController.text.trim(),
                  "GRN": Grn_No,
                  "Email": EmailController.text.trim(),
                  "Code": CodeController.text.trim(),
                  "password":passwordController.text.trim(),
                  "Course":courseController.text.trim(),
                  "College Name":collegenController.text.trim(),
                  "HSC Marks":collegemController.text.trim(),
                  "SSC Marks":schoolmController.text.trim(),
                  "School Name":schoolnController.text.trim()
                   });
                   print("Your GRN IS "+Grn_No);
                      }
                  on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                          print("Password is too weak");
                       } 
                    else if (e.code == 'email-already-in-use') {
                          print("Email is already in use");
                      } 
                    else {
                         print("database error \n $e");
                       }

                  }
                  catch (e) {
                    print("internal error try again!!\n");
                    print(e);
                    EmailController.clear();

                    }
                  }
                  else{
                    print("Invalid Email Id");
                    EmailController.clear();
                  }

                  },
                child:Text("Submit"),
                style: TextButton.styleFrom(minimumSize: Size(250,40)),

),

            ],
          )

        )


    )
      )


    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
// runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
// @override
// _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
// final _form = GlobalKey<FormState>();
// String title;
// void writeData() async {
// 	_form.currentState.save();
	
// 	// Please replace the Database URL
// 	// which we will get in “Add Realtime
// 	// Database” step with DatabaseURL
// 	var url = "DatabaseURL"+"data.json";
	
// 	// (Do not remove “data.json”,keep it as it is)
// 	try {
// 	final response = await http.post(
// 		Uri.parse(url),
// 		body: json.encode({"title": title}),
// 	);
// 	} catch (error) {
// 	throw error;
// 	}
// }

// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'RealTime Database',
// 	theme: ThemeData(
// 		primarySwatch: Colors.green,
// 	),
// 	home: Scaffold(
// 		appBar: AppBar(
// 		title: Text("GeeksforGeeks"),
// 		),
// 		body: Form(
// 		key: _form,
// 		child: Center(
// 			child: Column(
// 			children: [
// 				SizedBox(
// 				height: 10,
// 				),
// 				TextFormField(
// 				decoration: InputDecoration(hintText: "Enter Title"),
// 				onSaved: (value) {
// 					title = value;
// 				},
// 				),
// 				SizedBox(
// 				height: 10,
// 				),
// 				RaisedButton(
// 					onPressed: writeData,
// 					color: Colors.green,
// 					child: Text(
// 					"Submit",
// 					style: TextStyle(color: Colors.white),
// 					textAlign: TextAlign.center,
// 					)),
// 			],
// 			),
// 		),
// 		),
// 	),
// 	);
// }
// }
