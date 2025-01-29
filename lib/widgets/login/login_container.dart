import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/login/email_input.dart';
import 'package:to_do/widgets/login/login_signin_spacer.dart';
import 'package:to_do/widgets/login/password_input.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorTheme.borderBlack,
            blurRadius: 10,
            offset: Offset(10, 10),
          )
        ],
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Card(
          color: ColorTheme.primaryWhite,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 24,
              children: [
                EmailInput(),
                PasswordInput(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorTheme.ctaBG,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: double.infinity,
                  child: InkWell(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: LetterTheme.logo.copyWith(
                        fontSize: 16,
                        color: ColorTheme.ctaAccent,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                LoginSigninSpacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
