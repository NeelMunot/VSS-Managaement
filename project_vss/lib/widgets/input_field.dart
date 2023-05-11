import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const Inputfield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2),),
      ),
    );
  }
}

class Securefield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const Securefield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2),),
      ),
    );
  }
}