import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/screens/sign_in_screen.dart';

class LoginProviderNotifier extends StateNotifier<Map<String, String>> {
  LoginProviderNotifier()
      : super({
          'loginEmail': '',
          'loginPassword': '',
        });

  void resetLoginState() {
    state = {
      'loginEmail': '',
      'loginPassword': '',
    };
  }

  void changeLoginInput(String key, String value) {
    state = {
      ...state,
      key: value,
    };
  }

  void openSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SignInScreen(),
      ),
    );
  }
}

final LoginProvider =
    StateNotifierProvider<LoginProviderNotifier, Map<String, String>>(
  (ref) => LoginProviderNotifier(),
);
