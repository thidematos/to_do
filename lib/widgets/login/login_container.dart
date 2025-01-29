import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/login_provider.dart';
import 'package:to_do/services/firebase_auth_api.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/widgets/login/email_input.dart';
import 'package:to_do/widgets/login/login_signin_spacer.dart';
import 'package:to_do/widgets/login/password_input.dart';
import 'package:to_do/widgets/ui/styled_button.dart';

class LoginContainer extends ConsumerStatefulWidget {
  const LoginContainer({super.key});

  @override
  ConsumerState<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends ConsumerState<LoginContainer> {
  bool isLoading = false;

  void login(BuildContext ctx, String email, String password) async {
    setState(() {
      isLoading = true;
    });

    await FirebaseAuthApi.loginFirebase(ctx, email, password);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String email = ref.watch(LoginProvider)['loginEmail']!;
    final String password = ref.watch(LoginProvider)['loginPassword']!;

    print(email);

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
                if (isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorTheme.primaryBlue,
                    ),
                  ),
                if (!isLoading)
                  StyledButton(
                    'Login',
                    colorBg: ColorTheme.ctaBG,
                    colorLabel: ColorTheme.ctaAccent,
                    fontWeight: FontWeight.w900,
                    onTap: () {
                      ref.read(LoginProvider.notifier).resetLoginState();
                      FocusScope.of(context).unfocus();
                      login(context, email, password);
                    },
                  ),
                LoginSigninSpacer(),
                StyledButton(
                  'Sign In',
                  colorBg: Color.fromARGB(0, 0, 0, 0),
                  colorLabel: ColorTheme.black,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    ref.read(LoginProvider.notifier).openSignUp(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
