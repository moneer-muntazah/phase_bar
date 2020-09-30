import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        child: PhaseBar(),
      ),
    );
  }
}
class PhaseBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.greenAccent[100],
      constraints: BoxConstraints(
          minWidth: screenSize.width * 0.80,
          minHeight: screenSize.height * 0.1),
      child: CustomPaint(
        painter: StepperPainter(),
      ),
    );
  }
}

class Phase {

}

class StepperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const radius = 15.0;

    final x1 = 0.0, y1 = size.height / 2;
    final x2 = size.width, y2 = size.height / 2;
    final p1 = Offset(x1, y1), p2 = Offset(x2, y2);

    canvas.drawLine(p1, p2, paint);


    canvas.drawCircle(p1 + Offset(radius, 0.0), radius, paint);

    // final b = ParagraphBuilder(ParagraphStyle(
    //   fontSize: 12
    // ))..addText("text");
    //
    // canvas.drawParagraph(b.build(), p1);

    TextPainter(
        text: TextSpan(text: "text"),
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr
    )..layout()..paint(canvas, p1);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}