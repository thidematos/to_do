import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/themes/color_theme.dart';

class LetterTheme {
  const LetterTheme();

  static TextStyle body = GoogleFonts.lato().copyWith(
    color: ColorTheme.black,
    fontSize: 16,
  );

  static TextStyle placeholder = GoogleFonts.lato().copyWith(
    fontStyle: FontStyle.italic,
    color: const Color.fromARGB(219, 70, 70, 70),
    fontSize: 16,
  );

  static TextStyle logo = GoogleFonts.kantumruyPro(
    fontSize: 36,
    letterSpacing: 8,
    color: ColorTheme.primaryWhite,
    shadows: [
      Shadow(
        offset: Offset(2, 2),
        blurRadius: 10,
        color: ColorTheme.borderBlack,
      )
    ],
  );
}
