import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

class CustomInputField extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String labeltext;
   bool isObscure ;

   CustomInputField({Key? key, required this.icon, required this.controller, required this.labeltext,  this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
