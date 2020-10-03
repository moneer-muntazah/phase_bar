import 'package:flutter/material.dart';
import "package:flutter_app_paint/stages_bar.dart";

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
        child: StagesBar(
          textDirection: TextDirection.rtl,
          phases: <Phase>[
            Phase(text: "قيد المراجعة", status: PhaseStatus.Done),
            Phase(text: "قيد التجهيز", status: PhaseStatus.Done),
            Phase(text: "قيد التوصيل", status: PhaseStatus.Done),
            Phase(text: "مكتمل", status: PhaseStatus.InProgress),
            Phase(text: "ملغى"),
          ],
        ),
      ),
    );
  }
}
