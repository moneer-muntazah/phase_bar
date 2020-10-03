import "package:flutter/material.dart";
import "package:flutter/foundation.dart" show required;

enum PhaseStatus { Done, InProgress, ToCome }

/// A PDS
class Phase {
  final String text;
  final PhaseStatus status;

  Phase({@required this.text, this.status = PhaseStatus.ToCome})
      : assert(text != null && status != null);
}

class StagesBar extends StatelessWidget {
  final List<Phase> phases;
  final TextDirection textDirection;

  StagesBar({@required this.phases, this.textDirection = TextDirection.rtl})
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
        painter: StagesBarPainter(phases: phases, textDirection: textDirection),
      ),
    );
  }
}

class StagesBarPainter extends CustomPainter {
  final List<Phase> phases;
  final TextDirection textDirection;

  StagesBarPainter(
      {@required this.phases, this.textDirection = TextDirection.rtl})
      : assert(phases != null && phases.length >= 2 && textDirection != null);

  @override
  void paint(Canvas canvas, Size size) {
    const radius = 15.0;
    final dy = size.height / 3;

    final List<Phase> phases = textDirection == TextDirection.rtl
        ? this.phases.reversed.toList()
        : this.phases;

    final distance = (size.width - 2 * radius) / (phases.length - 1);

    final defaultPaint = Paint()
          ..color = Colors.redAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
        fillPaint = Paint()
          ..color = Colors.redAccent
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0,
        inProgressPaint = Paint()
          ..color = Colors.blueAccent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    for (int i = 0; i < phases.length; i += 1) {
      final double endpoint = distance * i;

      canvas.drawCircle(
          Offset(radius + endpoint, dy),
          radius,
          phases[i].status == PhaseStatus.Done
              ? fillPaint
              : (phases[i].status == PhaseStatus.InProgress
                  ? inProgressPaint
                  : defaultPaint));

      if (phases[i].status == PhaseStatus.Done) {
        final icon = Icons.done;
        TextPainter(
            text: TextSpan(
                text: String.fromCharCode(icon.codePoint),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: icon.fontFamily,
                    fontSize: 25)),
            textAlign: TextAlign.right,
            textDirection: textDirection)
          ..layout()
          ..paint(canvas, Offset(2.0 + (distance * i), dy - 13.0));
      }

      final next = i + 1.0;
      if (next < phases.length) {
        canvas.drawLine(
            Offset(radius * 2 + endpoint, dy),
            Offset(distance * next, dy),
            phases[textDirection == TextDirection.rtl ? i : next.toInt()]
                        .status ==
                    PhaseStatus.InProgress
                ? inProgressPaint
                : defaultPaint);
      }

      TextPainter(
          text: TextSpan(
              text: phases[i].text, style: TextStyle(color: Colors.black)),
          // textAlign: TextAlign.left,
          textDirection: textDirection)
        ..layout()
        ..paint(canvas, Offset(distance * i, dy + 20.0));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
