import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_auth_methods.dart';
// import 'package:firebase_auth_demo/services/firebase_auth_methods.dart';
// import 'package:firebase_auth_demo/widgets/custom_textfield.dart';

// class FirebaseAuthMethods {
//   final FirebaseAuth _auth;
//   FirebaseAuthMethods(this._auth);

//   User get user => _auth.currentUser!;

//   Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

//   Future<void> loginWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }
// }

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}


// class _LoginPageState extends State<LoginPage> {
//   bool visiblePassword = false;
//   String name ="";
//   final _formKey=GlobalKey<FormState>();
//   //const ({Key? key}) : super(key: key);
//   @override


class _LoginPageState extends State<LoginPage> {
  bool visiblePassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(){

    var loginWithEmail = context.read<FirebaseAuthMethods>().loginWithEmail(
      email : emailController.text,
      password : passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login-In Page")),
      body: Container(     

    color: Colors.white,
    child: SingleChildScrollView(
      child:Form(
        // key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Welcome",
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0,horizontal:32.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration:const InputDecoration(
                      hintText: "Enter EmailId.",
                        labelText:" EmailId.",
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
                    controller: passwordController,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: (){print("forgot password");},
                          child: const Text("Forgot Password ?"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed:loginUser,
                    child:const Text("Login"),
                    style: TextButton.styleFrom(minimumSize: const Size(250, 40)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    const Text("New to this app?"),
                    TextButton(onPressed: (){print("sign up");},
                        child: const Text("Sign Up"))
                  ],
                )
                ],
              ),

            )
          ],
        ),
      ),

    ),
      )
    );
  }
}