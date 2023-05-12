import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late DatabaseReference _databaseReference;
  late String _name;
  late String _grn;
  late String _email;
  late String _phoneNumber;
  late String _address;
  late String _tenth;
  late String _twelth;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize the database reference
    _databaseReference = FirebaseDatabase.instance.reference().child("users").child("1234");

    // Retrieve the data from the database
  //   _databaseReference.once().then((DataSnapshot snapshot) {
  //     setState(() {
  //       // Set the state variables with the retrieved data
  //       _name = snapshot.value['name'];
  //       _email = snapshot.value['email'];
  //       _phoneNumber = snapshot.value['phone_number'];
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(16.0),
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
      ),
    );
  }
}
}