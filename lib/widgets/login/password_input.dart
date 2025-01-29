import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/login_provider.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class PasswordInput extends ConsumerWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: LetterTheme.body,
      onChanged: (value) {
        ref
            .read(LoginProvider.notifier)
            .changeLoginInput('loginPassword', value);
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        hintStyle: LetterTheme.placeholder,
        prefixIcon: Icon(
          Icons.lock,
          color: ColorTheme.tertiaryBlue,
        ),
      ),
    );
  }
}
