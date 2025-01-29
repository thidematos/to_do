import 'package:flutter/material.dart';
import 'package:to_do/themes/letter_theme.dart';

class BecomeAsimover extends StatelessWidget {
  const BecomeAsimover({super.key});

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
                'Seja um Asimover'.toUpperCase(),
                style: LetterTheme.logo.copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
