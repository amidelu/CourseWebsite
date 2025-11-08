import 'package:flutter/material.dart';

import 'widgets/projects_table.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ProjectsTable(),
    );
  }
}
