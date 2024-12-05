import 'package:flutter/material.dart';

class BottomRightTrianglePainter extends CustomPainter {
  final Color color;
  BottomRightTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 0)  // 시작점을 오른쪽으로
      ..lineTo(size.width, size.height)  // 오른쪽 아래로
      ..lineTo(0, 0)  // 왼쪽 위로
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// 왼쪽에서 오른쪽으로 향하는 삼각형
class BottomLeftTrianglePainter extends CustomPainter {
  final Color color;
  BottomLeftTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)  // 시작점을 왼쪽으로
      ..lineTo(0, size.height)  // 왼쪽 아래로
      ..lineTo(size.width, 0)  // 오른쪽 위로
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}