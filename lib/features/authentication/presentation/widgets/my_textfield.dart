import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator; 
  final String hinttext;

  const MyTextfield({
    super.key,
    required this.controller,
    this.validator, required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
    );
  }
}
