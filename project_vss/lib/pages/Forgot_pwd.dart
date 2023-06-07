import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:VSS/widgets/input_field.dart';
import 'package:VSS/Backend.dart';
class Forgot_pwd extends StatefulWidget {
  const Forgot_pwd({Key? key}) : super(key: key);

  @override
  State<Forgot_pwd> createState() => _Forgot_pwdState();
}

class _Forgot_pwdState extends State<Forgot_pwd> {
  final TextEditingController grnController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();
void Forgot() async{


  String Grn_No=grnController.text.trim();
  print(Grn_No);
  String email="";
  print(Grn_No);
if(GRN.validateGrn(Grn_No))
{
    await UserData.checkdata(Grn_No);
    Map<String,String> data=UserData.User_data;
    
    if(EmailValidator.validate(data["Email"]!))
    {
    email= data["Email"].toString();
    print(email);
    await _auth.sendPasswordResetEmail(email: email);
       popups.showMessage(context, "Password Reset Email is Sent to the provided GRN Number's Email-ID \n\nUse the New Password For Logging in to your account.");

    }
    
   else {
    grnController.clear();
    popups.showMessage(context, "No user is found with GRN No. '$Grn_No' ");
      }
      
}
else{
    grnController.clear();
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
              Text( "Forgot Passsword",
            style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,),),
              SizedBox(
                height: 50,
              ),

              Inputfield(hintText: "Enter GRN NO.", labelText: "GRN NO." ,controller:grnController,/*call validatory conditions here*/),
              SizedBox(
                height: 15,
              ),

              //____________Forgot Button______________
              ElevatedButton(onPressed: (){
                Forgot();
                },
                 child: Text("Submit"),style: TextButton.styleFrom(minimumSize: Size(250, 40)),),
              SizedBox(
                height: 15,
              ),



            ],
          ),
        ),
      )
    ) ;
  }
}
