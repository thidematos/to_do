import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: ColorTheme.primaryWhite,
        ),
      ),
    );
  }
}
