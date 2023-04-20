import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visiblePassword = false;
  String name ="";
  final _formKey=GlobalKey<FormState>();
  //const ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
    color: Colors.white,
    child: SingleChildScrollView(
      child:Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              "Welcome",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0,horizontal:32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration:InputDecoration(
                      hintText: "Enter GRN No.",
                        labelText:" GRN No.",
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty){
                        return 'Please enter the GRN no.';
                      }else if(value.length>9){
                        return "Enter correct GRN no.";
                      }
                      return null;
                    },

                  ),
                  TextFormField(
                    obscureText: visiblePassword,
                    decoration:InputDecoration(
                      hintText: "Enter Password",
                      labelText:"Password",
                      suffixIcon: IconButton(onPressed: (){
                       setState(() {
                         visiblePassword= !visiblePassword;
                       });
                      },icon: Icon(visiblePassword ? Icons.visibility :Icons.visibility_off),)
                    ),
                    validator:(value){
                      if(value==null || value.isEmpty){
                        return 'Please enter the password';
                      }else if(value.length<8){
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
                      TextButton(onPressed: (){print("forgot password");},
                          child: Text("Forgot Password ?"))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed:(){
                    print("Login Button is pressed");
                  },
                    child:Text("Login"),
                    style: TextButton.styleFrom(minimumSize: Size(250, 40)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    Text("New to this app?"),
                    TextButton(onPressed: (){print("sign up");},
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
