import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:VSS/widgets/input_field.dart';
import 'package:VSS/Backend.dart';

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
  final TextEditingController courseController = TextEditingController(); //here

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  final List<String> items = [
    'Mumbai',
    'Amravati',
    'Pune',
    'Nagpur',
    'Nanded',
    'Akola',
    'Aurangabad',
    'Chandrapur',
    'Ratnagiri'
  ];
  String? selectedValue;
  String? _selectedbatch = "B1";
  String? _selectedGender = "M";
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registration Page"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 21.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your Full Name",
                  labelText: "Name",
                  controller:
                      nameController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                //----------------------checkbox for gender--------------
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                CheckboxListTile(
                  title: Text('Male'),
                  value: _selectedGender == "M",
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedGender = "M";
                      } else if (_selectedGender == "M") {
                        value = true;
                      } else {
                        _selectedGender = null;
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Female'),
                  value: _selectedGender == "F",
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedGender = "F";
                      } else if (_selectedGender == "F") {
                        value = true;
                      } else {
                        _selectedGender = null;
                      }
                    });
                  },
                ),

                //----------------------checkbox for Batches--------------
                Text(
                  "Select a Batch",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                CheckboxListTile(
                  title: Text('B1'),
                  value: _selectedbatch == "B1",
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedbatch = value == true ? 'B1' : _selectedbatch;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('B2'),
                  value: _selectedbatch == "B2",
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedbatch = value == true ? "B2" : _selectedbatch;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('B3'),
                  value: _selectedbatch == "B3",
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedbatch = value == true ? "B3" : _selectedbatch;
                    });
                  },
                ),

                //-----------------------------------------------------------------------

                Inputfield(
                  hintText: "Enter Your Phone Number",
                  labelText: "Phone Number",
                  controller:
                      phoneController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your Email Address",
                  labelText: "Email Address",
                  controller:
                      emailController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

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
                      padding: const EdgeInsets.only(left: 12, right: 14),
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
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your Address",
                  labelText: "Address",
                  controller:
                      addressController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your SSC Marks",
                  labelText: "SSC Marks",
                  controller:
                      tenthController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your HSC Marks",
                  labelText: "HSC Marks",
                  controller:
                      twelthController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Enter Your Current Course Name",
                  labelText: "Current course",
                  controller:
                      courseController, /*call validatory conditions here*/ //here
                ),
                SizedBox(
                  height: 15,
                ),

                Inputfield(
                  hintText: "Create Your Password",
                  labelText: "Password",
                  controller:
                      passwordController, /*call validatory conditions here*/
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String Email = emailController.text.trim();
                        int User_Count = -1;
                        int Batch_count = -1;
                        await ref
                            .child("Counters/User_count")
                            .onValue
                            .first
                            .then((event) {
                          User_Count =
                              int.parse(event.snapshot.value.toString());
                        });
                        await ref
                            .child("Counters/$_selectedbatch")
                            .onValue
                            .first
                            .then((event) {
                          Batch_count =
                              int.parse(event.snapshot.value.toString());
                        });
                        String Grn_No = GRN.generateGrn(
                            _selectedGender.toString(), User_Count);
                        String password = passwordController.text.trim();

                        print(password);
                        if (EmailValidator.validate(Email)) {
                          try {
                            UserCredential userCredential =
                                await _auth.createUserWithEmailAndPassword(
                                    email: Email, password: password);
                            await ref
                                .child("Counters/User_count")
                                .set(User_Count + 1);
                            await ref
                                .child("Counters/$_selectedbatch")
                                .set(Batch_count + 1);
                            await ref
                                .child("Batches/$_selectedbatch/$Grn_No")
                                .set(nameController.text.trim());

                            await ref.child("users/$Grn_No").set({
                              "name": nameController.text.trim(),
                              "Phone Number": phoneController.text.trim(),
                              "GRN": Grn_No,
                              "Gender": _selectedGender,
                              "Batch": _selectedbatch,
                              "Email": emailController.text.trim(),
                              "password": passwordController.text.trim(),
                              "HSC Marks": twelthController.text.trim(),
                              "SSC Marks": tenthController.text.trim(),
                              "Course": courseController.text.trim(), //here
                              "address": addressController.text.trim() +
                                  selectedValue.toString(),
                            });
                            popups.showMessage(context,
                                "GRN Number alloted to you is \n '$Grn_No' \n Use this for Logging in your account. ");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print("Password is too weak");
                              popups.showMessage(
                                  context, "Password is too weak");
                            } else if (e.code == 'email-already-in-use') {
                              print("Email is already in use");
                              popups.showMessage(
                                  context, "Email is already in use");
                            } else {
                              print("database error \n $e");
                              popups.showMessage(
                                  context, "database error \n $e");
                            }
                          } catch (e) {
                            print("internal error try again!!\n");
                            print(e);
                            emailController.clear();
                          }
                        } else {
                          print("Invalid Email Id");
                          emailController.clear();
                        }
                      },
                      child: Text("Submit"),
                      style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
