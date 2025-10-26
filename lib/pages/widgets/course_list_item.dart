import 'package:course_website/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseListItem extends StatelessWidget {
  final Course course;

  const CourseListItem({super.key, required this.course});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

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
                    Text(course.courseName,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4.0),
                    Text('Year: ${course.year}'),
                    const SizedBox(height: 4.0),
                    Text('Platform: ${course.platform}'),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 1,
                color: Colors.amber,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (course.verificationLink != null) {
                      _launchURL(course.verificationLink!);
                    }
                  },
                  child: course.certificateImage.endsWith('.pdf')
                      ? FutureBuilder<PdfPageImage?>(
                          future: _renderPdfPage(course.certificateImage),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Image.memory(snapshot.data!.bytes);
                            } else if (snapshot.hasError) {
                              return const Icon(Icons.error);
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )
                      : Image.asset(
                          course.certificateImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}