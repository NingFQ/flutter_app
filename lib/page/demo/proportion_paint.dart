import 'package:flutter/material.dart';
import 'package:flutter_app/common/canvas/pain_proportion.dart';
import 'dart:math' as math;

class ProportionPaint extends StatefulWidget {
  @override
  _ProportionPaintState createState() => _ProportionPaintState();
}

class _ProportionPaintState extends State<ProportionPaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('绘制比例图'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            // Container(
            //   width: 100,
            //   height: 20,
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     shape: BoxShape.rectangle
            //   ),
            // ),
            Container(
              child: CustomPaint(
                  painter: PainCanvas(rate: 0.3,limitWidth: 300.0)
              ),
            )
            // Container(
            //   width: 100,
            //   height: 25,
            //   color: Colors.green,
            // ),
            // Positioned(
            //     bottom: 0,
            //     right: -10,
            //     child: Transform.rotate(
            //       angle: math.pi / 4,
            //       child: Container(
            //         width: 25,
            //         height: 21,
            //         color: Colors.green,
            //       ),
            //     )
            // ),
          ],
        )
      ),
    );
  }
}
