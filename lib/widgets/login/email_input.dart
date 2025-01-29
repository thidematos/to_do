import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      style: LetterTheme.body,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'toninho@asimov.com',
        hintStyle: LetterTheme.placeholder,
        prefixIcon: Icon(
          Icons.email,
          color: ColorTheme.tertiaryBlue,
        ),
      ),
    );
  }
}
