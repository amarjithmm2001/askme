import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final Widget page;
  final String text_1;
  final String text_2;

  const MyRichText({
    super.key,
    required this.page,
    required this.text_1,
    required this.text_2,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle1 = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
    );

    final textStyle2 = const TextStyle(
      color: Colors.green,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    return RichText(
      text: TextSpan(
        text: text_1,
        style: textStyle1,
        children: <TextSpan>[
          TextSpan(
            text: text_2,
            style: textStyle2,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => page,
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
