import 'dart:ui';
import 'package:flutter/material.dart';

class PainCanvas extends CustomPainter {
  double limitWidth = 300.0;
  final double limitHeight = 15.0;
  double rate = 0.01;// 右侧的比例
  final Color colorLeft = Color(0xFFF95E3C);
  final Color colorRight = Color(0xFFF95E3C).withOpacity(0.3);
  PainCanvas({@required this.rate,this.limitWidth,});
  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    paint
        ..color = colorLeft // 线段填充颜色
        ..strokeWidth = 10 // 宽度 既线段宽度
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill;

    Path path2 = Path();
    path2.lineTo(0, 0);
    path2.lineTo(limitWidth * rate, 0);
    path2.lineTo(limitWidth * rate + (rate == 0 ? 0 : 10), limitHeight);
    path2.lineTo(0, limitHeight);
    canvas.drawPath(path2,paint);



    Path path1 = Path();
    paint
      ..color = colorRight;
    path1.moveTo(limitWidth * rate + 5, 0);
    path1.lineTo(limitWidth, 0);
    path1.lineTo(limitWidth, limitHeight);
    path1.lineTo(limitWidth * rate + (rate == 0 ? 5 : 15), limitHeight);
    canvas.drawPath(path1,paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}