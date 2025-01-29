import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

void showSnackbar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorTheme.errorRed,
      padding: const EdgeInsets.symmetric(vertical: 12),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: LetterTheme.body.copyWith(
              color: ColorTheme.primaryWhite,
            ),
          )
        ],
      ),
    ),
  );
}
