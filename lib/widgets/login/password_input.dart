import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: LetterTheme.body,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: LetterTheme.placeholder,
        prefixIcon: Icon(
          Icons.lock,
          color: ColorTheme.tertiaryBlue,
        ),
      ),
    );
  }
}
