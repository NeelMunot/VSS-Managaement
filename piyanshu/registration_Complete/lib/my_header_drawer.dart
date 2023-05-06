import 'package:flutter/material.dart';
import 'Backend.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  Map<String,String> data=UserData.data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(199, 9, 141, 141),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/Profile.png'),

                )
            ),
          ),
          Text(data["name"].toString(), style: TextStyle(color: Colors.white,fontSize: 20),),
          Text(data["Email"].toString(), style: TextStyle(color: Colors.grey[200], fontSize: 14),),
      ]),
    );
  }
}