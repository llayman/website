import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Column(
              children: [
                const Text("Lucas Layman, Ph.D."),
                const Text("Department of Computer Science"),
                const Text("Campus Box 5935"),
                const Text("601 South College Rd."),
                const Text("Wilmington NC 28409"),
                const Text("+1 (910) 962-3672"),
                SelectableLinkify(onOpen: _onOpen, text: "laymanl@uncw.edu"),
                const Text("CV (PDF)"),
                Wrap(children: [
                  RichText(
                      text: TextSpan(
                    children: [
                      const TextSpan(
                          text: 'I am an Assistant Professor in the '),
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
                            ..onTap =
                                () => launchUrlString('https://uncw.edu/')),
                      const TextSpan(
                          text:
                              ". I research human factors in software engineering and computer security with forays into machine learning and analytics.")
                    ],
                  ))
                ]),
              ],
            ),
            Image.asset('images/laymanl.jpg'),
          ],
        )
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunchUrlString(link.url)) {
      await launchUrlString(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
