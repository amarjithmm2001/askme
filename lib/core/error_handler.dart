import 'package:flutter/material.dart';

class ErrorHandler {
  static void showError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void logError(String error) {
    print('Error: $error');
  }
}
