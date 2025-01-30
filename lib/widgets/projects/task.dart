import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/tasks_provider.dart';
import 'package:to_do/services/firebase_firestore_api.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/utils/formatDate.dart';

final Map<String, Color> _priorityColors = {
  'low': ColorTheme.validatedGreen,
  'medium': ColorTheme.dangerYellow,
  'high': ColorTheme.errorRed,
};

class Task extends ConsumerStatefulWidget {
  const Task(this.task, {super.key});

  final task;

  @override
  ConsumerState<Task> createState() => _TaskState();
}

class _TaskState extends ConsumerState<Task> {
  var user;
  bool isLoading = false;

  void getUser() async {
    final data = await FirebaseFirestoreApi.getUser(widget.task['userID']);

    setState(() {
      user = data;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void changeIsComplete(state) async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(widget.task['taskID'])
        .update(
      {'isComplete': state},
    );

    setState(() {
      isLoading = false;
    });

    ref.invalidate(TasksProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _priorityColors[widget.task['priority']],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                foregroundImage:
                    user != null ? NetworkImage(user['photo']) : null,
              ),
              Spacer(),
              Text(
                widget.task['taskName'],
                style: LetterTheme.body.copyWith(
                  decoration: widget.task['isComplete']
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '#${widget.task['storypoints'].toString()}',
                style: LetterTheme.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Criado em ${formatDate((widget.task['createdAt'] as Timestamp).toDate())}',
                style: LetterTheme.body.copyWith(fontSize: 12),
              ),
              Switch(
                value: widget.task['isComplete'],
                onChanged: (value) {
                  changeIsComplete(value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
