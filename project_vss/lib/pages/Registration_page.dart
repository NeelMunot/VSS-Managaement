
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/input_field.dart';
import 'package:flutter_application_1/Backend.dart';
enum Gender{Male,Female}
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController tenthController = TextEditingController();
  final TextEditingController twelthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  final List<String> items = [
    'Mumbai','Amravati','Pune','Nagpur','Nanded','Akola','Aurangabad','Chandrapur','Ratnagiri'
  ];
  String? selectedValue;

  Gender? _gender;
  @override
  Widget build(BuildContext context) {
    var _gender;
    return Scaffold(
        appBar: AppBar(title: Text("Registration Page"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:16.0,horizontal:21.0),
          child: Column(
            children: [
              SizedBox(height: 15,),

              Inputfield(hintText: "Enter Your Full Name", labelText: "Name" ,controller:nameController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              //-------------------Radiobutton------------------------------
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<Gender>(
                        contentPadding:EdgeInsets.all(0.0),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),value: Gender.Male, groupValue:_gender,
                        dense: true,
                        title:Text(Gender.Male.name),
                        onChanged:(val){
                          setState(() {
                            var _gender= val;
                          });
                        }),
                  ),
                  SizedBox(width: 5.0,),
                  Expanded(
                    child: RadioListTile<Gender>(
                        contentPadding:EdgeInsets.all(0.0),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),value: Gender.Female, groupValue:_gender,
                        dense: true,
                        title: Text(Gender.Female.name), onChanged:(val){
                      setState(() {
                        var _gender= val;
                      });
                    }),
                  ),

                ],
              ),
      //-----------------------------------------------------------------------

              Inputfield(hintText: "Enter Your Phone Number", labelText: "Phone Number" ,controller:phoneController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              Inputfield(hintText: "Enter Your Email Address", labelText: "Email Address" ,controller:emailController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              //-------------------- Call **"Drop down button"** here from dropdown.dart and delete this code upto the mark----------------------------------------------------------------------------------------------------------------------
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: const [
                      SizedBox(
                          width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select District',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 380,
                    padding: const EdgeInsets.only(left:12, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 0,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 300,
                    padding: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.white,
                    ),
                    elevation: 8,
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness: MaterialStateProperty.all<double>(6),
                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 20, right: 20),
                  ),
                ),
              ),
//----------------------------------------------------------------------------------------------------------------
               SizedBox(height: 15,),


              Inputfield(hintText: "Enter Your Address", labelText: "Address" ,controller:addressController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              Inputfield(hintText: "Enter Your SSC Marks", labelText: "SSC Marks" ,controller:tenthController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              Inputfield(hintText: "Enter Your HSC Marks", labelText: "HSC Marks" ,controller:twelthController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              Inputfield(hintText: "Enter Your Current Course Name", labelText: "Current course" ,controller:twelthController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),
              
              Inputfield(hintText: "Create Your Password", labelText: "Password" ,controller:passwordController ,/*call validatory conditions here*/),
              SizedBox(height: 15,),

              Row(
                children: [
                  ElevatedButton(onPressed: () async {

                String Email=emailController.text.trim();
                int User_Count=-1;
                await ref.child("Counters/User_Count").onValue.first.then((event) {
                User_Count = int.parse(event.snapshot.value.toString());
                });
                String Grn_No=GRN.generateGrn("M",User_Count);
                String password=passwordController.text.trim();

                print(password);
                if(EmailValidator.validate(Email))
                {
                  try{
                UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: Email,password: password);
                await ref.child("Counters/User_count").set(User_Count+1);
                String? uid=userCredential.user?.uid;
                await ref.child("users/$Grn_No").set({
                  "name": nameController.text.trim(),
                  "Phone Number": phoneController.text.trim(),
                  "GRN": Grn_No,
                  "Email": emailController.text.trim(),
                  "password":passwordController.text.trim(),
                  "HSC Marks":twelthController.text.trim(),
                  "Batch":"",
                  "SSC Marks":tenthController.text.trim(),
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
                    emailController.clear();

                    }
                  }
                  else{
                    print("Invalid Email Id");
                    emailController.clear();
                  }


                  }, child:Text("Submit"),style: TextButton.styleFrom(minimumSize: Size(100,40)), ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}



