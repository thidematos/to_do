import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widgets/ui/error_snackbar.dart';
import 'package:uuid/uuid.dart';

final _instance = FirebaseFirestore.instance;

final uuid = Uuid();

class FirebaseFirestoreApi {
  FirebaseFirestoreApi();

  static Future<bool> createUserData(BuildContext context, String imageUrl,
      String email, String name, String area) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      await _instance.collection('users').doc(currentUser!.uid).set({
        'name': name,
        'email': email,
        'photo': imageUrl,
        'area': area,
        'uid': currentUser.uid
      });

      return true;
    } catch (err) {
      return false;
    }
  }

  static addNewTask(String taskName, int storypoints, String priority,
      String projectID) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    final taskId = uuid.v4();

    await _instance.collection('tasks').doc(taskId).set(
      {
        'taskName': taskName,
        'storypoints': storypoints,
        'priority': priority,
        'projectID': projectID,
        'taskID': taskId,
        'createdAt': Timestamp.now(),
        'userID': currentUser.uid,
        'isComplete': false,
      },
    );
  }

  static Future getUser(String userID) async {
    final user = await _instance.collection('users').doc(userID).get();

    return user.data();
  }

  static Future getTasks() async {
    final tasks = await _instance.collection('tasks').get();

    return tasks;
  }

  static addNewProject(String projectTitle, String area) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    final usarData =
        await _instance.collection('users').doc(currentUser.uid).get();

    final id = uuid.v4();

    _instance.collection('projects').doc(id).set({
      'id': id,
      'createdBy': currentUser.uid,
      'createdAt': Timestamp.now(),
      'title': projectTitle,
      'area': area
    });
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getProjects() async {
    final projects = await _instance.collection('projects').get();

    return projects;
  }
}
