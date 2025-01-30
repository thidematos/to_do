import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/tasks_provider.dart';
import 'package:to_do/themes/color_theme.dart';
import 'package:to_do/widgets/projects/task.dart';
import 'package:to_do/widgets/ui/rocket.dart';

class TasksList extends ConsumerWidget {
  const TasksList(this.projectID, {super.key});

  final String projectID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksFuture = ref.watch(TasksProvider);

    return tasksFuture.when(
      data: (data) {
        final List tasks = data.docs;

        final filteredTasks =
            tasks.where((task) => task['projectID'] == projectID).toList();

        if (filteredTasks.isEmpty) {
          return Center(
            child: Rocket(
              'Não há tasks',
              28,
              color: ColorTheme.black,
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredTasks.length,
          itemBuilder: (context, index) {
            return Task(filteredTasks[index]);
          },
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Algo deu errado!'),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
