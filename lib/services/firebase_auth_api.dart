import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/ui/error_snackbar.dart';

final kFirebaseInstance = FirebaseAuth.instance;

class FirebaseAuthApi {
  const FirebaseAuthApi();

  static Future createUser(BuildContext context, email, password) async {
    print(email);
    print(password);
    try {
      final createdUser = await kFirebaseInstance
          .createUserWithEmailAndPassword(email: email, password: password);

      return createdUser;
    } on FirebaseAuthException catch (err) {
      print(err.message);
      showSnackbar(context, 'Houve um erro ao criar o Asimover!');
    }
  }

  static Future loginFirebase(ctx, email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (err) {
      showSnackbar(ctx, 'Usuário ou senha incorretos!');
    }
  }

  static Future logOutFirebase() async {
    await FirebaseAuth.instance.signOut();
  }
}
