import 'package:flutter/material.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/login/login_container.dart';
import 'package:to_do/widgets/ui/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 36,
        children: [
          Logo(),
          Expanded(
            child: ListView(
              children: [
                LoginContainer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
