import 'package:flutter/material.dart';

class TextLargeBold extends StatelessWidget {
  final String text;
  const TextLargeBold({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
