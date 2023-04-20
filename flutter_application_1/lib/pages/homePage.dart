import 'package:flutter/material.dart';

import '../my_header_drawer.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        backgroundColor: Color.fromARGB(199, 9, 141, 141),
        title: Text("Vidyarthi Shayyak Samiti"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),

              ]),
          )
          
          
          )
          ),
      

      
      body: Column(
        children: [
          Image.asset("assets/images/Hostel.jpg"),
          // Padding(padding: Padding.top(20)),
          Text("          "),
          Text("Welcome ",textScaleFactor: 3,textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(199, 9, 141, 141),fontSize: 20),),
          Text("          "),

          Text("Vidyarthi Shayyak Samiti's Digital Portal ",textScaleFactor: 2,textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(199, 9, 141, 141),fontSize: 20),),
          Text("          "),
          Text("          "),
          Text("          "),
          Image.asset("assets/images/Hostel2.jpg"),
        ]
        ),
      
    );

  }
  Widget MyDrawerList(){
        return Container(
          padding: EdgeInsets.only(top: 15,),
          child: Column(
            children: [
              // shows the list of menu drawer
              menuItem(),

          ]),
        );
      }

  Widget menuItem(){
    return Material(
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.dashboard_outlined,
                  size: 20, 
                  color: Colors.black,
                  ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,

                      ),
                  ),
                  ),

          ]),
        ),
      )
       
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}