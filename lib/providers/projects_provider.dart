import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/services/firebase_firestore_api.dart';

final ProjectsProvider = FutureProvider((ref) async {
  final projects = await FirebaseFirestoreApi.getProjects();
  return projects;
});
