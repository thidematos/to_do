import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/widgets/login/sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 48),
        children: [
          //Center(child: BecomeAsimover()),
          //const SizedBox(height: 24),
          SignIn(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: ColorTheme.primaryWhite,
          size: 28,
        ),
      ),
    );
  }
}
