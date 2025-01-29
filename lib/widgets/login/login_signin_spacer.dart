import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class LoginSigninSpacer extends StatelessWidget {
  const LoginSigninSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Expanded(
            child: Container(
              color: ColorTheme.borderBlack,
              height: 1,
              width: double.infinity,
            ),
          ),
          Text(
            'ou',
            style: LetterTheme.body.copyWith(
              color: const Color.fromARGB(130, 40, 40, 40),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorTheme.borderBlack,
              height: 1,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
