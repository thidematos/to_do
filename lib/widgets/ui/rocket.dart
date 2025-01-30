import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class Rocket extends StatelessWidget {
  Rocket(this.label, this.fontSize, {Color? color, super.key})
      : labelColor = color ?? ColorTheme.primaryWhite;

  final String label;
  final double fontSize;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 250,
      width: 250,
      child: Stack(
        children: [
          Positioned(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/rocket.png',
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Text(
                label,
                style: LetterTheme.logo.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: fontSize,
                  color: labelColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
