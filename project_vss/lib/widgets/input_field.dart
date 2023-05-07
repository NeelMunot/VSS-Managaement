import 'package:flutter/material.dart';

class Inputfield extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  const Inputfield ({Key? key, required this.hintText, required this.labelText, required this.controller}) : super(key: key);

  @override
  State<Inputfield> createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        hintText:widget.hintText,
        labelText: widget.labelText,
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
        )
      ),

      /*Add validatory conditions here*/

    );
  }
}
