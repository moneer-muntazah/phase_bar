import 'package:flutter/material.dart';
import "package:flutter_app_paint/phase_bar.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PhaseBar"),
      ),
      body: Center(
        child: PhaseBar(
          phases: <Phase>[
            Phase(text: "One"),
            Phase(text: "One", completed: true),
            Phase(text: "One"),
            Phase(text: "One"),
            Phase(text: "One"),
          ],
        ),
      ),
    );
  }
}
