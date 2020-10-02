import "package:flutter/material.dart";
import "package:flutter/foundation.dart" show required;

/// A PDS
class Phase {
  final String text;
  final bool completed;
  Phase({@required this.text, this.completed}) : assert(text != null);
}

class PhaseBar extends StatelessWidget {
  final List<Phase> phases;
  final TextDirection textDirection;

  PhaseBar({@required this.phases, this.textDirection = TextDirection.rtl})
      : assert(phases != null && phases.length >= 2 && textDirection != null);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.greenAccent[100],
      constraints: BoxConstraints(
          minWidth: screenSize.width * 0.80,
          minHeight: screenSize.height * 0.1),
      child: CustomPaint(
        painter: PhaseBarPainter(phases: phases, textDirection: textDirection),
      ),
    );
  }
}

class PhaseBarPainter extends CustomPainter {
  final List<Phase> phases;
  final TextDirection textDirection;

  PhaseBarPainter({@required this.phases, this.textDirection = TextDirection.rtl})
      : assert(phases != null && phases.length >= 2 && textDirection != null);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    const r = 15.0;

    final equalDistance = (size.width - 2 * r) / (phases.length - 1);

    final x1 = r, y1 = size.height / 2;
    final x2 = size.width, y2 = size.height / 2;
    final p1 = Offset(x1, y1), p2 = Offset(x2, y2);

    Offset distance(double dx) => Offset(dx, 0.0);

    //
    // canvas.drawLine(p1, p2, paint);
    //

    // canvas.drawCircle(p1 + Offset(r, 0.0), r, paint);
    // canvas.drawCircle(p1 + Offset(d, 0.0), r, paint);
    // canvas.drawCircle(p1 + Offset(d + d, 0.0), r, paint);
    //
    for (int i = 0; i < phases.length; i += 1) {
      canvas.drawCircle(p1 + distance(equalDistance * i), r, paint);
    }

    //
    // // final b = ParagraphBuilder(ParagraphStyle(
    // //   fontSize: 12
    // // ))..addText("text");
    // //
    // // canvas.drawParagraph(b.build(), p1);
    //
    // TextPainter(
    //     text: TextSpan(text: "text"),
    //     textAlign: TextAlign.left,
    //     textDirection: TextDirection.ltr)
    //   ..layout()
    //   ..paint(canvas, p1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
