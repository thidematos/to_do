import 'package:flutter/material.dart';
import 'package:to_do/widgets/projects/project_card.dart';

class ProjectCardsContainer extends StatelessWidget {
  const ProjectCardsContainer(this.projects, {super.key});

  final List projects;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCard(projects[index]);
        },
      ),
    );
  }
}
