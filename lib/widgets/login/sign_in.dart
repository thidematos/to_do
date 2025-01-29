import 'package:flutter/material.dart';
import 'package:to_do/services/firebase_auth_api.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/utils/validations.dart';
import 'package:to_do/widgets/login/choose_photo.dart';
import 'package:to_do/widgets/ui/error_snackbar.dart';
import 'package:to_do/widgets/ui/styled_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  String? email = '';

  String? password = '';

  String? passwordConfirm = '';

  String area = 'mobile';

  String? name = '';

  bool isLoading = false;

  void submit(BuildContext ctx) async {
    final bool isValidate = formKey.currentState!.validate();

    if (!isValidate) return;

    formKey.currentState!.save();

    if (!Validations.verifyPasswords(password!, passwordConfirm!)) {
      showSnackbar(ctx, 'As senhas não coincidem');
      return;
    }

    setState(() {
      isLoading = true;
    });

    final createdUser = await FirebaseAuthApi.createUser(ctx, email, password);

    Navigator.of(ctx).pop();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 28,
              children: [
                ChoosePhoto(),
                TextFormField(
                  validator: (value) => Validations.isNull(value, 'nome'),
                  textCapitalization: TextCapitalization.sentences,
                  onSaved: (value) => name = value,
                  decoration: InputDecoration().copyWith(
                      hintText: 'Toninho Asimov',
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: ColorTheme.tertiaryBlue),
                ),
                TextFormField(
                  validator: (value) => Validations.email(value),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration().copyWith(
                    hintText: 'toninho@asimov.com',
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: ColorTheme.tertiaryBlue,
                  ),
                  onSaved: (newValue) => email = newValue,
                ),
                TextFormField(
                  validator: (value) => Validations.password(value),
                  obscureText: true,
                  onSaved: (value) => password = value,
                  decoration: InputDecoration().copyWith(
                      hintText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                      prefixIconColor: ColorTheme.tertiaryBlue),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) => Validations.password(value),
                  onSaved: (value) => passwordConfirm = value,
                  decoration: InputDecoration().copyWith(
                      hintText: 'Confirme sua senha',
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: ColorTheme.tertiaryBlue),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration().copyWith(labelText: 'Área'),
                  value: area,
                  items: [
                    DropdownMenuItem(
                      value: 'mobile',
                      child: Text('Mobile'),
                    ),
                    DropdownMenuItem(
                      value: 'data_science',
                      child: Text('Ciência de Dados'),
                    ),
                    DropdownMenuItem(
                      value: 'desktop',
                      child: Text('Desktop'),
                    ),
                  ],
                  onChanged: (value) => area = value!,
                ),
                if (isLoading)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!isLoading)
                  StyledButton(
                    'Pau na máquina  🚀',
                    colorBg: ColorTheme.ctaBG,
                    fontWeight: FontWeight.bold,
                    colorLabel: ColorTheme.ctaAccent,
                    onTap: () {
                      submit(context);
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
