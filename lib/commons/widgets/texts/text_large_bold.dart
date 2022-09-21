import 'package:flutter/material.dart';

class TextLargeBoldBlack extends StatelessWidget {
  final String text;
  const TextLargeBoldBlack({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TextLargeBoldWhite extends StatelessWidget {
  final String text;
  const TextLargeBoldWhite({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
