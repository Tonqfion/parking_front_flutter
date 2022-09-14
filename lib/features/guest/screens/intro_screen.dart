import 'package:flutter/material.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/home';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return const Scaffold(
      body: Center(
        child: Text('Hey'),
      ),
    );
  }
}
