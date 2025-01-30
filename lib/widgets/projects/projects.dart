import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/projects_provider.dart';
import 'package:to_do/providers/user_provider.dart';
import 'package:to_do/widgets/projects/project_cards_container.dart';
import 'package:to_do/widgets/ui/rocket.dart';

class Projects extends ConsumerStatefulWidget {
  const Projects({super.key});

  @override
  ConsumerState<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends ConsumerState<Projects> {
  var userData;

  void getUserData() async {
    final user = await ref.read(UserProvider);

    setState(() {
      userData = user.data();
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final projectsFuture = ref.watch(ProjectsProvider);

    if (userData == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return projectsFuture.when(
      data: (projects) {
        final projectsList = projects.docs;

        final filteredProjects = projectsList
            .where((project) => project['area'] == userData['area'])
            .toList();

        print(userData);

        if (filteredProjects.isEmpty) {
          return Center(
            child: Rocket('Ainda não há nenhum projeto!', 32),
          );
        }

        return ProjectCardsContainer(filteredProjects);
      },
      error: (error, stackTrace) => Column(
        children: [
          Center(
            child: Text('Error'),
          )
        ],
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
