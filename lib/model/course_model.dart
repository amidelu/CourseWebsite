class Course {
  final String courseName;
  final String year;
  final String platform;
  final String certificateImage;
  final String? verificationLink;

  Course({
    required this.courseName,
    required this.year,
    required this.platform,
    required this.certificateImage,
    this.verificationLink,
  });
}