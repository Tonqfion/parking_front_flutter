import 'package:flutter/material.dart';

class TextRegularWhite extends StatelessWidget {
  final String text;
  const TextRegularWhite({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
