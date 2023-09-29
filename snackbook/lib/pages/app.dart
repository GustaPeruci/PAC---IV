import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'signup.dart';

class SnackBookApp extends StatelessWidget {
  const SnackBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnackBook',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignupPage(),
        '/': (BuildContext context) => const HomePage(),
      },
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Tajawal',
      ),
    );
  }
}
