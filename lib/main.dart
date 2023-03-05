import 'package:flutter/material.dart';
import 'package:webpage/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SelectionArea(
                child: Scaffold(
                    appBar: AppBar(
                      bottom: const TabBar(
                        tabs: [
                          Tab(text: "Home"),
                          Tab(text: "Research"),
                          Tab(text: "Teaching"),
                        ],
                      ),
                    ),
                    body: Column(
                      children: const [
                        Expanded(
                            child: TabBarView(
                          children: [
                            HomePage(),
                            Icon(Icons.directions_transit),
                            Icon(Icons.directions_bike),
                          ],
                        )),
                        Text(
                            "Last updated: January 7, 2023. Content © Lucas Layman")
                      ],
                    ))),
          )),
    );
  }
}
