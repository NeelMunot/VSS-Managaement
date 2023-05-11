import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Homepage_admin.dart';
import 'package:flutter_application_1/pages/Homepage_user.dart';
import 'package:flutter_application_1/pages/Registration_page.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:flutter_application_1/Backend.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController grnController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();
void login() async{



//batch list for table
// await Batches.get_batches("B1");
// Map<String,String> batch=Batches.cur_batch;
//   print(batch);


  String Grn_No=grnController.text.trim();
  String PWD=passwordController.text.trim();
  print(Grn_No);
  print(PWD);
  String email="";
  String userid="";
  print(Grn_No);
if(GRN.validateGrn(Grn_No))
{
    await UserData.checkdata(Grn_No);
    Map<String,String> data=UserData.data;
    
    if(data.isNotEmpty)
    {
    email= data["Email"].toString();
    print(email);
    try{
      _auth.signInWithEmailAndPassword(email: email, password: PWD);
      if(_auth.currentUser?.emailVerified==false)
        {
          await _auth.currentUser?.sendEmailVerification();
          popups.showMessage(context, "User is not verified\n A verification link is sent to verify");
        }
      else
      {       if(data['role']=="Teacher")
              {
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Homepage_admin()),
              );
              }
              else{
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Homepage_user()),
              );                
              }
      }
    } on FirebaseAuthException catch (e)
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
   else {
    grnController.clear();
    popups.showMessage(context, "No user is found with GRN No. '$Grn_No' ");
    passwordController.clear();
      }
      
}
else{
    grnController.clear();
    passwordController.clear();
    popups.showMessage(context,"Invalid GRN No. Provided");
    }




}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:16.0,horizontal:32.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text( "Welcome",
            style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,),),
              SizedBox(
                height: 50,
              ),

              Inputfield(hintText: "Enter GRN NO.", labelText: "GRN NO." ,controller:grnController,/*call validatory conditions here*/),

              Securefield(hintText: "Enter the password ", labelText: "password" ,controller:passwordController,/*call validatory conditions here*/),

              SizedBox(
                height: 15,
              ),


              //____________Forgot password______________
              Row(
                children: [
                  TextButton(onPressed: (){print("forgot password");},
                      child: Text("Forgot Password ?"))
                ],
              ),

              //____________Login Button______________
              ElevatedButton(onPressed: (){
                login();
                },
                 child: Text("Login"),style: TextButton.styleFrom(minimumSize: Size(250, 40)),),
              SizedBox(
                height: 15,
              ),


              //____________Sign Up Button______________
              Row(
                children: [
                  Text("New to this app?"),
                  TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration()),
                              );
                  }, child: Text("Sign Up"))
                ],
              ),

            ],
          ),
        ),
      )
    ) ;
  }
}
