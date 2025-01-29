import 'package:flutter/material.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/geral_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: kGeralTheme,
      home: LoginScreen(),
    );
  }
}
