import 'package:flutter/material.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/themes/letter_theme.dart';
import 'package:to_do/widgets/projects/new_to_do.dart';
import 'package:to_do/widgets/projects/tasks_list.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {super.key});

  final project;

  @override
  Widget build(BuildContext context) {
    print(project['id']);

    return Container(
      margin: const EdgeInsets.only(right: 24),
      width: 350,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 24,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    project['title'],
                    style: LetterTheme.logo.copyWith(
                      fontSize: 24,
                      color: ColorTheme.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => NewToDo(project['id']),
                    ),
                    icon: Icon(Icons.add),
                    iconSize: 32,
                    color: ColorTheme.tertiaryBlue,
                  ),
                ],
              ),
              Expanded(
                child: TasksList(project['id']),
              )
            ],
          ),
        ),
      ),
    );
  }
}
