import 'package:flutter/material.dart';
import 'package:parking/commons/widgets/bottom_bar.dart';
import 'package:parking/constants/global_variables.dart';
import 'package:parking/features/auth/services/auth_service.dart';
import 'package:parking/providers/user_provider.dart';
import 'package:parking/router.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserdata(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Moto',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
