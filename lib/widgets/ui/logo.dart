import 'package:flutter/material.dart';
import 'package:to_do/themes/letter_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          spacing: 12,
          children: [
            Image.asset(
              'assets/logo-branca.png',
              width: 150,
              color: const Color.fromARGB(221, 255, 255, 255),
            ),
            Text(
              'ASIMOV',
              style: LetterTheme.logo,
            ),
          ],
        ),
      ],
    );
  }
}
