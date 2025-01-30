import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

final kGeralTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: ColorTheme.primaryBlue,
  inputDecorationTheme: InputDecorationTheme().copyWith(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: ColorTheme.secondaryBlue),
    ),
    hintStyle: LetterTheme.placeholder,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: ColorTheme.borderBlack, width: 0.5),
    ),
  ),
);
