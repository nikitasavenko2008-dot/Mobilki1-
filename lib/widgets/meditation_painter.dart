import 'dart:math' as math;
import 'package:flutter/material.dart';

class MeditationPainter extends CustomPainter {
  final Color baseColor;

  MeditationPainter({required this.baseColor});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    _drawGround(canvas, w, h);
    _drawLeaves(canvas, w, h);
    _drawFigure(canvas, w, h);
  }

  void _drawGround(Canvas canvas, double w, double h) {
    final paint = Paint()
      ..color = baseColor.withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(w * 0.15, h * 0.88)
      ..lineTo(w * 0.50, h * 0.75)
      ..lineTo(w * 0.85, h * 0.88)
      ..lineTo(w * 0.50, h * 1.00)
      ..close();

    canvas.drawPath(path, paint);
  }

  void _drawLeaves(Canvas canvas, double w, double h) {
    _drawLeaf(canvas, Offset(w * 0.12, h * 0.82), w * 0.12, h * 0.18, -0.5, baseColor.withValues(alpha: 0.55));
    _drawLeaf(canvas, Offset(w * 0.22, h * 0.78), w * 0.10, h * 0.22, -0.2, baseColor.withValues(alpha: 0.65));
    _drawLeaf(canvas, Offset(w * 0.08, h * 0.75), w * 0.09, h * 0.16, -0.8, baseColor.withValues(alpha: 0.45));
    _drawLeaf(canvas, Offset(w * 0.88, h * 0.82), w * 0.12, h * 0.18, 0.5, baseColor.withValues(alpha: 0.55));
    _drawLeaf(canvas, Offset(w * 0.78, h * 0.78), w * 0.10, h * 0.22, 0.2, baseColor.withValues(alpha: 0.65));
    _drawLeaf(canvas, Offset(w * 0.92, h * 0.75), w * 0.09, h * 0.16, 0.8, baseColor.withValues(alpha: 0.45));
    _drawLeaf(canvas, Offset(w * 0.18, h * 0.92), w * 0.08, h * 0.10, -0.3, baseColor.withValues(alpha: 0.40));
    _drawLeaf(canvas, Offset(w * 0.82, h * 0.92), w * 0.08, h * 0.10, 0.3, baseColor.withValues(alpha: 0.40));
  }

  void _drawLeaf(Canvas canvas, Offset center, double width, double height, double angle, Color color) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, -height / 2)
      ..cubicTo(width / 2, -height / 4, width / 2, height / 4, 0, height / 2)
      ..cubicTo(-width / 2, height / 4, -width / 2, -height / 4, 0, -height / 2)
      ..close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  void _drawFigure(Canvas canvas, double w, double h) {
    const skinColor = Color(0xFFF5C6A0);
    const darkColor = Color(0xFF2D2D2D);

    final cx = w * 0.5;
    final bodyBottom = h * 0.78;
    final bodyTop = h * 0.42;

    final legPaint = Paint()
      ..color = darkColor
      ..style = PaintingStyle.fill;

    final leftLeg = Path()
      ..moveTo(cx - w * 0.18, bodyBottom)
      ..cubicTo(
        cx - w * 0.22, bodyBottom - h * 0.08,
        cx - w * 0.05, bodyBottom - h * 0.06,
        cx, bodyBottom - h * 0.02,
      )
      ..cubicTo(
        cx - w * 0.05, bodyBottom + h * 0.02,
        cx - w * 0.18, bodyBottom + h * 0.01,
        cx - w * 0.18, bodyBottom,
      )
      ..close();
    canvas.drawPath(leftLeg, legPaint);

    final rightLeg = Path()
      ..moveTo(cx + w * 0.18, bodyBottom)
      ..cubicTo(
        cx + w * 0.22, bodyBottom - h * 0.08,
        cx + w * 0.05, bodyBottom - h * 0.06,
        cx, bodyBottom - h * 0.02,
      )
      ..cubicTo(
        cx + w * 0.05, bodyBottom + h * 0.02,
        cx + w * 0.18, bodyBottom + h * 0.01,
        cx + w * 0.18, bodyBottom,
      )
      ..close();
    canvas.drawPath(rightLeg, legPaint);

    final footPaint = Paint()
      ..color = skinColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx - w * 0.16, bodyBottom - h * 0.005),
          width: w * 0.07,
          height: h * 0.03),
      footPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx + w * 0.16, bodyBottom - h * 0.005),
          width: w * 0.07,
          height: h * 0.03),
      footPaint,
    );

    final bodyPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final torso = Path()
      ..moveTo(cx - w * 0.12, bodyBottom - h * 0.02)
      ..cubicTo(
        cx - w * 0.14, bodyTop + h * 0.12,
        cx - w * 0.13, bodyTop + h * 0.05,
        cx, bodyTop + h * 0.04,
      )
      ..cubicTo(
        cx + w * 0.13, bodyTop + h * 0.05,
        cx + w * 0.14, bodyTop + h * 0.12,
        cx + w * 0.12, bodyBottom - h * 0.02,
      )
      ..close();
    canvas.drawPath(torso, bodyPaint);

    final armPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final leftArm = Path()
      ..moveTo(cx - w * 0.13, bodyTop + h * 0.07)
      ..cubicTo(
        cx - w * 0.10, bodyTop + h * 0.12,
        cx - w * 0.04, bodyTop + h * 0.14,
        cx - w * 0.01, bodyTop + h * 0.13,
      )
      ..lineTo(cx - w * 0.01, bodyTop + h * 0.11)
      ..cubicTo(
        cx - w * 0.05, bodyTop + h * 0.11,
        cx - w * 0.10, bodyTop + h * 0.09,
        cx - w * 0.11, bodyTop + h * 0.06,
      )
      ..close();
    canvas.drawPath(leftArm, armPaint);

    final rightArm = Path()
      ..moveTo(cx + w * 0.13, bodyTop + h * 0.07)
      ..cubicTo(
        cx + w * 0.10, bodyTop + h * 0.12,
        cx + w * 0.04, bodyTop + h * 0.14,
        cx + w * 0.01, bodyTop + h * 0.13,
      )
      ..lineTo(cx + w * 0.01, bodyTop + h * 0.11)
      ..cubicTo(
        cx + w * 0.05, bodyTop + h * 0.11,
        cx + w * 0.10, bodyTop + h * 0.09,
        cx + w * 0.11, bodyTop + h * 0.06,
      )
      ..close();
    canvas.drawPath(rightArm, armPaint);

    final handPaint = Paint()
      ..color = skinColor
      ..style = PaintingStyle.fill;
    final handPath = Path()
      ..moveTo(cx, bodyTop + h * 0.10)
      ..cubicTo(cx - w * 0.025, bodyTop + h * 0.12, cx - w * 0.025, bodyTop + h * 0.15, cx, bodyTop + h * 0.16)
      ..cubicTo(cx + w * 0.025, bodyTop + h * 0.15, cx + w * 0.025, bodyTop + h * 0.12, cx, bodyTop + h * 0.10)
      ..close();
    canvas.drawPath(handPath, handPaint);

    final neckPaint = Paint()
      ..color = skinColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(cx, bodyTop + h * 0.04),
          width: w * 0.05,
          height: h * 0.04),
      neckPaint,
    );

    final headPaint = Paint()
      ..color = skinColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx, bodyTop + h * 0.005),
          width: w * 0.16,
          height: h * 0.09),
      headPaint,
    );

    final hairPaint = Paint()
      ..color = darkColor
      ..style = PaintingStyle.fill;

    final hairPath = Path()
      ..moveTo(cx - w * 0.08, bodyTop + h * 0.005)
      ..cubicTo(
        cx - w * 0.09, bodyTop - h * 0.04,
        cx - w * 0.03, bodyTop - h * 0.06,
        cx, bodyTop - h * 0.05,
      )
      ..cubicTo(
        cx + w * 0.03, bodyTop - h * 0.06,
        cx + w * 0.09, bodyTop - h * 0.04,
        cx + w * 0.08, bodyTop + h * 0.005,
      )
      ..cubicTo(
        cx + w * 0.05, bodyTop - h * 0.01,
        cx - w * 0.05, bodyTop - h * 0.01,
        cx - w * 0.08, bodyTop + h * 0.005,
      )
      ..close();
    canvas.drawPath(hairPath, hairPaint);

    canvas.drawCircle(Offset(cx - w * 0.08, bodyTop - h * 0.02), w * 0.04, hairPaint);
    canvas.drawCircle(Offset(cx + w * 0.06, bodyTop - h * 0.03), w * 0.045, hairPaint);

    final eyePaint = Paint()
      ..color = darkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(cx - w * 0.035, bodyTop + h * 0.005),
          width: w * 0.025,
          height: h * 0.012),
      0,
      math.pi,
      false,
      eyePaint,
    );
    canvas.drawArc(
      Rect.fromCenter(
          center: Offset(cx + w * 0.035, bodyTop + h * 0.005),
          width: w * 0.025,
          height: h * 0.012),
      0,
      math.pi,
      false,
      eyePaint,
    );
  }

  @override
  bool shouldRepaint(covariant MeditationPainter oldDelegate) => false;
}
