import 'package:course_website/pages/course_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CourseWebsiteApp());
}

class CourseWebsiteApp extends StatelessWidget {
  const CourseWebsiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amidelu Course Website',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CourseListPage(),
    );
  }
}