import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/projects/new_project.dart';

class StyledAppBar {
  StyledAppBar(this.parentContext, this.invalidateUser);

  final BuildContext parentContext;
  final Function() invalidateUser;

  AppBar get widget {
    return AppBar(
      toolbarHeight: 75,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: parentContext,
              builder: (context) => NewProject(context),
            );
          },
          icon: Icon(
            Icons.work,
            color: ColorTheme.secondaryBlue,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () async {
            invalidateUser();
            await FirebaseAuth.instance.signOut();
          },
          icon: Icon(
            Icons.exit_to_app,
            color: ColorTheme.tertiaryBlue,
            size: 28,
          ),
        ),
      ],
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 35,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'ASIMOV',
            style: LetterTheme.logo.copyWith(
              color: ColorTheme.black,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
