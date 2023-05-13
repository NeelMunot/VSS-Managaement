import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/Backend.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name="";
  String _grn="";
  String _email="";
  String _phoneNumber="";
  String _address="";
  String _tenth="";
  String _twelth="";

  @override
  void initState() {
    super.initState();

    //data received in data variable when user logins

    //value for above variblles is given here

    // Map<String,String> data=UserData.User_data;
    // _name=data["Name"]!;
    // _grn=data["GRN"]!;
    // _email=data["Email"]!;
    // _phoneNumber=data["Phone Number"]!;
    // _address=data["address"]!;
    // _tenth=data["SSC Marks"]!;
    // _twelth=data["HSC Marks"]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $_name',
                      style: TextStyle(fontSize: 18.0),
                    ),
      
                    SizedBox(height: 8.0),
                    Text(
                      'grn: $_grn',
                      style: TextStyle(fontSize: 18.0),
                    ),

                    SizedBox(height: 8.0),
                    Text(
                      'Email: $_email',
                      style: TextStyle(fontSize: 18.0),
                    ),
      
                    SizedBox(height: 8.0),
                    Text(
                      'Phone Number: $_phoneNumber',
                      style: TextStyle(fontSize: 18.0),
                    ),
      
                    SizedBox(height: 8.0),
                    Text(
                      'address: $_address',
                      style: TextStyle(fontSize: 18.0),
                    ),

                    SizedBox(height: 8.0),
                    Text(
                      'Tenth : $_tenth',
                      style: TextStyle(fontSize: 18.0),
                    ),
      
                    SizedBox(height: 8.0),
                    Text(
                      'twelth: $_twelth',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
          
      ),
    );
  }
}



