import 'package:flutter/material.dart';

class ACETabBarIndicator extends Decoration {
  // 指示器类型
  final ACETabBarIndicatorType type;
  // 指示器高度
  final double height;
  // 指示器颜色
  final Color color;

  ACETabBarIndicator({@required this.type,this.color,this.height});

  @override
  BoxPainter createBoxPainter([onChanged]) => _ACETabBarIndicatorPainter(
    this,type,color,height, onChanged
  );
}

class _ACETabBarIndicatorPainter extends BoxPainter {
  final ACETabBarIndicator decoration;
  ACETabBarIndicatorType type;
  double height;
  Color color;

  _ACETabBarIndicatorPainter(
    this.decoration,
    this.type,
    this.color,
    this.height,
    VoidCallback onChanged
  );

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    double _height = height ?? _kIndicatorHeight;
    Paint _paint = Paint()
      ..color = color ?? _kIndicatorColor
      ..strokeCap = (type == ACETabBarIndicatorType.roundLine) ? StrokeCap.round : StrokeCap.butt
      ..strokeWidth = (height / 2)// 控制线段宽度
      ..style = PaintingStyle.fill;

      switch(type) {
        // 圆角横线
        case ACETabBarIndicatorType.roundLine:
          canvas.drawLine(
            Offset(offset.dx, configuration.size.height - (height / 2)),
            Offset(offset.dx + configuration.size.width, configuration.size.height - (height / 2)),
            _paint
          );
          break;
        // 矩形横线s
        case ACETabBarIndicatorType.rectLine:
          canvas.drawLine(
            Offset(offset.dx, configuration.size.height - _height / 1.6),
            Offset(offset.dx + configuration.size.width, configuration.size.height - _height / 1.6),
            _paint
          );
          break;
        // 矩形
        case ACETabBarIndicatorType.rect:
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(offset.dx, offset.dy, configuration.size.width, configuration.size.height),
              Radius.circular(_kIndicatorAngle)
            ),
            _paint
          );
          break;
    }
  }
}

enum ACETabBarIndicatorType {
  rect,
  roundLine, // 圆角下划线
  rectLine // 定长圆角下划线
}


// 默认指示器颜色
const Color _kIndicatorColor = Color(0xFFFF5E1B);
// 默认指示器高度
const double _kIndicatorHeight = 10.0;
// 指示器圆角
const double _kIndicatorAngle = 12.5;
