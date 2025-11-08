import 'package:course_website/features/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';

import 'features/courses/pages/course_list_page.dart';

void main() {
  runApp(const CourseWebsiteApp());
}

class CourseWebsiteApp extends StatelessWidget {
  const CourseWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amidelu',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DashboardPage(),
    );
  }
}