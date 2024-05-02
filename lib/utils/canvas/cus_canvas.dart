import 'dart:ui';

import 'package:flutter/material.dart';

class CCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Triangle

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..color = Colors.red
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.2090083, size.height * 0.0035571);
    path_1.lineTo(size.width * -0.0266833, size.height * -0.0593000);
    path_1.lineTo(size.width * 0.0003250, size.height * 0.3581857);
    path_1.lineTo(size.width * 0.2090083, size.height * 0.0035571);
    path_1.close();

    canvas.drawPath(path_1, paint_stroke_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
