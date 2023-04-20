import 'package:flutter/material.dart';

class MyForm extends StatefulWidget{
  @override
  State<StatefulWidget>createState(){
    return MyFormState();
  }
}
class MyFormState extends State<MyForm>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Registration Page"),),

      body: Container(

padding:EdgeInsets.symmetric(vertical:25.0,horizontal:20.0),
child:SingleChildScrollView(
    child:Form(
          child:Column(
            children:<Widget> [

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Your Name",
                    border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.0)
          )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "Enter Your Phone number",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter phone number";
                  }
                  else if(value.length<10 || value.length<10){
                    return "Enter valid number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email address",
                    hintText: "Enter Your email address",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter email address";
                  }

                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " Password",
                    hintText: "Create new password",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter password";
                  }
                  else if(value.length<8){
                    return "password should have 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " current course",
                    hintText: "Enter Your current course",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter current course";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " School Name",
                    hintText: "Enter Your  School Name",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter school name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " College Name",
                    hintText: "Enter Your  College Name",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter college name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " SSC Marks",
                    hintText: "Enter Your  SSC Marks",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),validator: (value){
                if(value==null|| value.isEmpty){
                  return "please enter SSC marks";
                }
                else if(value.characters==true){
                  return "Enter correct marks";
                }
                return null;
              },
              ),
              SizedBox(
                height:25,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: " HSC Marks",
                    hintText: "Enter Your  HSC Marks",
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0)
                    )
                ),
                validator: (value){
                  if(value==null|| value.isEmpty){
                    return "please enter HSC marks ";
                  }
                  else if(value.characters==true){
                    return "Enter correct Marks";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:25,
              ),

ElevatedButton(onPressed: (){
    print("Submit button is pressed");
    },
    child:Text("Submit"),
    style: TextButton.styleFrom(minimumSize: Size(250,40)),

),

            ],
          )

        )


    )
      )


    );
  }
}