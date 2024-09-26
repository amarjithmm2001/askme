import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonname;
  const MyButton({super.key, required this.buttonname});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      color: Colors.green,
      child:  Center(
        child: Text(
          buttonname,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
