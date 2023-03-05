import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widgets.dart';

class TeachingSummary extends StatelessWidget {
  const TeachingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        H1("Teaching"),
        H2("Office Hours"),
        Text("Wednesday 9–11 in CG 2045 or by appointment."),
        H2("Spring 2023"),
        CourseRef(
          'CSC 351',
          "Applied Software Security",
          url: 'https://uncw.instructure.com/courses/63301',
        ),
        CourseRef(
          'CSC 450/550',
          "Software Engineering",
          url: 'https://uncw.instructure.com/courses/67153',
        ),
        H2("Previous"),
        CourseRef('CSC 231', "Introduction to Data Structures"),
        CourseRef('CSC 242', "Computer Organization"),
        CourseRef('CSC 315', "Mobile Applications Development"),
        CourseRef('CSC 475/592', "Engineering Secure Software"),
      ],
    );
  }
}

class CourseRef extends StatelessWidget {
  const CourseRef(this.courseNum, this.name, {this.url, super.key});
  final String courseNum;
  final String name;
  final String? url;

  @override
  Widget build(BuildContext context) {
    var number = url != null
        ? TextSpan(
            text: courseNum,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrlString(url!))
        : TextSpan(text: courseNum);

    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: '\u2022 '),
          number,
          TextSpan(text: " – $name"),
        ],
      ),
    );
  }
}
