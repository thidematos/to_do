import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/login_provider.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';

class EmailInput extends ConsumerWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return TextField(
      onChanged: (value) {
        ref.read(LoginProvider.notifier).changeLoginInput('loginEmail', value);
      },
      style: LetterTheme.body,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'toninho@asimov.com',
        hintStyle: LetterTheme.placeholder,
        prefixIcon: Icon(
          Icons.email,
          color: ColorTheme.tertiaryBlue,
        ),
      ),
    );
  }
}
