import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UserProvider = Provider((ref) async {
  final curUser = FirebaseAuth.instance.currentUser!;
  final userData = await FirebaseFirestore.instance
      .collection('users')
      .doc(curUser.uid)
      .get();

  return userData;
});
