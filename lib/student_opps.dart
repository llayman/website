import 'package:flutter/material.dart';

class StudentOpportunities extends StatelessWidget {
  const StudentOpportunities({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
            "I am currently seeking one student to collaborate on a research projects culminating in an undergraduate or master's thesis on the following subjects:'"),
        OppCard(
          title: 'Human Factors in Cyber Defense',
          intro:
              "I have multiple research projects in this area playing to different strengths and interests. Some focus on psychology, some on HCI, and some on computer vision/machine learning.",
          learn:
              "research methodology; data analysis using Python pandas; psychological issues in cyber defense",
          perfectFor:
              "Students with an interest in cyber security or human-computer interaction",
          when: "2–3 semesters beginning Spring or Fall 2023.",
          reqs:
              "minimum 3.2 GPA and junior or higher standing, strong programming skills, self-motivated and inquisitive",
          preferred:
              "experience in one or more of: eye tracking, deep learning, JavaScript, React/Electron development",
        ),
        OppCard(
          title: 'Trust in Automation',
          intro:
              "I am interested in how AI and recommender-system behavior influences human trust in automation, and the impacts of UI design on trust.",
          learn:
              "research methodology; user experience issues; psychological biases",
          perfectFor:
              "Students with an interest in artificial intelligence, human factors, and UI/UX ",
          when: "2–3 semesters beginning Spring or Fall 2023.",
          reqs:
              "minimum 3.2 GPA and junior or higher standing, strong programming skills, self-motivated and inquisitive",
          preferred: "Python skills, web development experience",
        )
      ],
    ));
  }
}

class OppCard extends StatelessWidget {
  const OppCard(
      {this.title,
      this.intro,
      this.learn,
      this.perfectFor,
      this.when,
      this.reqs,
      this.preferred,
      super.key});

  final String? title;
  final String? intro;
  final String? learn;
  final String? perfectFor;
  final String? when;
  final String? reqs;
  final String? preferred;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              SelectableText(
                title!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            if (intro != null) SelectableText(intro!),
            if (perfectFor != null)
              SelectableText.rich(TextSpan(children: [
                const TextSpan(
                    text: "Perfect for: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: perfectFor!)
              ])),
            if (when != null)
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "When: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: when!)
              ])),
            if (reqs != null)
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Requirements: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: reqs!)
              ])),
            if (preferred != null)
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Preferred: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: preferred!)
              ])),
          ],
        ),
      ),
    );
  }
}
