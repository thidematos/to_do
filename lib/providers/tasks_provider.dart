import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/services/firebase_firestore_api.dart';

final TasksProvider = FutureProvider((ref) async {
  final tasks = await FirebaseFirestoreApi.getTasks();

  return tasks;
});
