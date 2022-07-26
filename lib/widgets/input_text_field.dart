import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';


class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    required this.hint
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: false,
      textAlign: TextAlign.center,
      cursorColor: Colors.white ,
      decoration: kTextFieldInputDecoration.copyWith(
          hintText: hint),
    );
  }
}