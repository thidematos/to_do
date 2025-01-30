import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/projects_provider.dart';
import 'package:to_do/providers/user_provider.dart';
import 'package:to_do/services/firebase_firestore_api.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/ui/error_snackbar.dart';
import 'package:to_do/widgets/ui/styled_button.dart';

class NewProject extends ConsumerStatefulWidget {
  NewProject(this.modalContext, {super.key});

  final BuildContext modalContext;

  @override
  ConsumerState<NewProject> createState() => _NewProjectState();
}

class _NewProjectState extends ConsumerState<NewProject> {
  String? projectName;

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void createProject() async {
    final bool isValidate = formKey.currentState!.validate();

    if (!isValidate) {
      showSnackbar(context, 'Adicione um nome ao projeto!');
      return;
    }

    formKey.currentState!.save();

    setState(() {
      isLoading = true;
    });

    final userData = await ref.read(UserProvider);

    await FirebaseFirestoreApi.addNewProject(
        projectName!, userData.data()!['area']);

    ref.invalidate(ProjectsProvider);

    Navigator.of(widget.modalContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 28,
          children: [
            Text(
              'Novo projeto'.toUpperCase(),
              style: LetterTheme.logo.copyWith(
                fontSize: 20,
                color: ColorTheme.black,
              ),
            ),
            Form(
              key: formKey,
              child: TextFormField(
                onSaved: (value) => projectName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Dê um nome ao projeto!';
                  }

                  return null;
                },
                decoration: InputDecoration().copyWith(
                  hintText: 'Aperam',
                  prefixIcon: Icon(
                    Icons.android,
                    size: 32,
                    color: ColorTheme.secondaryBlue,
                  ),
                ),
              ),
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (!isLoading)
              StyledButton(
                'Criar projeto!',
                colorBg: ColorTheme.ctaBG,
                fontWeight: FontWeight.w900,
                colorLabel: ColorTheme.ctaAccent,
                onTap: createProject,
              )
          ],
        ),
      ),
    );
  }
}
