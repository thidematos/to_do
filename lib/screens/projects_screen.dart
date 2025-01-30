import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/user_provider.dart';
import 'package:to_do/widgets/projects/projects.dart';
import 'package:to_do/widgets/ui/styled_app_bar.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: StyledAppBar(context, () {
        ref.invalidate(UserProvider);
      }).widget,
      body: Projects(),
    );
  }
}
