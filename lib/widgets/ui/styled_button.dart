import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.label,
      {required this.colorBg,
      required this.fontWeight,
      required this.colorLabel,
      required this.onTap,
      super.key});

  final String label;
  final Color colorLabel;
  final Color colorBg;
  final FontWeight fontWeight;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorTheme.borderBlack,
        ),
        color: colorBg,
        borderRadius: BorderRadius.circular(6),
      ),
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: LetterTheme.logo.copyWith(
            fontSize: 16,
            color: colorLabel,
            fontWeight: fontWeight,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
