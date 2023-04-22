import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final courseController = TextEditingController();
  final schoolnController = TextEditingController();
  final schoolmController = TextEditingController();
  final collegenController = TextEditingController();
  final collegemController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    courseController.dispose();
    passwordController.dispose();
    schoolnController.dispose();
    schoolmController.dispose();
    collegenController.dispose();
    collegemController.dispose();
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
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email address",
                    hintText: "Enter Your email address",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter email address";
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
                DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

                await ref.set({
                  "name": nameController.text.trim(),
                  "Phone Number": phoneController.text.trim(),
                  "Email": emailController.text.trim(),
                  "password":passwordController.text.trim(),
                  "Course":courseController.text.trim(),
                  "College Name":collegenController.text.trim(),
                  "HSC Marks":collegemController.text.trim(),
                  "SSC Marks":schoolmController.text.trim(),
                  "School Name":schoolnController.text.trim()
                  });
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
