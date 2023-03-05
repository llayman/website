import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webpage/student_opps.dart';

import 'teaching_summary.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: ListView(
          children: const [
            Header(),
            Divider(color: Colors.black),
            TeachingSummary(),
            Divider(color: Colors.black),
            StudentOpportunities(),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lucas Layman, Ph.D."),
              const Text("Department of Computer Science"),
              const Text("Campus Box 5935"),
              const Text("601 South College Rd."),
              const Text("Wilmington NC 28409"),
              const Text("+1 (910) 962-3672"),
              SelectableLinkify(
                  onOpen: (link) => launchUrlString(link.url),
                  text: "laymanl@uncw.edu"),
              const Text("CV (PDF)"), // TODO: ADD CV
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(text: 'I am an Assistant Professor in the '),
                  TextSpan(
                      text: 'Department of Computer Science',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => launchUrlString('https://uncw.edu/csc/')),
                  const TextSpan(text: " at the "),
                  TextSpan(
                      text: 'University of North Carolina Wilmington',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrlString('https://uncw.edu/')),
                  const TextSpan(
                      text:
                          ". I research human factors in software engineering and computer security with forays into machine learning and analytics.")
                ],
              ))
            ],
          ),
        ),
        Image.asset('images/laymanl.jpg'),
      ],
    );
  }
}
