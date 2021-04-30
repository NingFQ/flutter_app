import 'dart:ui' as ui;
import 'package:flutter/material.dart';


class MyCustomCanvas extends CustomPainter {

 final MyCanvasType type;
 MyCustomCanvas({@required this.type});

  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    switch(type) {
      case MyCanvasType.Circle:
        // 绘制圆
        canvas.drawCircle(Offset(size.width / 2 - 10, 90), 20, paint);
        break;
      case MyCanvasType.LineRound:
        canvas.drawLine(
            Offset(size.width / 2 - 50,0),
            Offset(size.width / 2 + 50,0),
            paint
            ..color = Colors.red // 线段填充颜色
            ..strokeWidth = 20 // 宽度 既线段宽度
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.fill
            ..shader = ui.Gradient.linear(
              Offset(size.width / 2 - 50,0),
              Offset(size.width / 2 + 50,0),
              [
                Color(0xFFFF5E1B),
                Color(0xFFEF9440),
              ],
            )
        );
        break;
      case MyCanvasType.LineRect:
        canvas.drawLine(
            Offset(size.width / 2 - 50,0),
            Offset(size.width / 2 + 50,0),
            paint
            ..color = Colors.red // 线段填充颜色
            ..strokeWidth = 20 // 宽度 既线段宽度
            ..strokeCap = StrokeCap.square
            ..shader = ui.Gradient.linear(
              Offset(size.width / 2 - 50,0),
              Offset(size.width / 2 + 50,0),
              [
                Color(0xFFFF5E1B),
                Color(0xFFEF9440),
              ],
            )
        );
        break;
    }
  }




  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


enum MyCanvasType {
  Circle,
  LineRound,
  LineRect
}