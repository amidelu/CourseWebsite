import 'package:flutter/material.dart';
import '../../model/course_model.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  const CourseListItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(course.courseName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4.0),
                    Text('Year: ${course.year}'),
                    const SizedBox(height: 4.0),
                    Text('Issuer: ${course.issuer}'),
                  ],
                ),
              ),
              const VerticalDivider(width: 1, color: Colors.amber),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          course.courseName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        content: Image.asset(course.certificateFilePath, fit: BoxFit.contain),
                      ),
                    );
                  },
                  child: Image.asset(course.certificateFilePath, width: 100, height: 100, fit: BoxFit.fitHeight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
