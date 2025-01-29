import 'package:flutter/material.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/ui/styled_app_bar.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar,
      body: Center(
        child: Text(
          'motherfucker',
          style: LetterTheme.body,
        ),
      ),
    );
  }
}
