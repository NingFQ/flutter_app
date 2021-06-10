import 'package:flutter/material.dart';
import 'package:flutter_app/common/canvas/pain_proportion.dart';
import 'package:flutter_app/common/widgets/gradient_button.dart';

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
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: CustomPaint(
                painter: PainCanvas(rate: 0.3,limitWidth: 200.0)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: GradientButton(
                width: 200,
                height: 80,
                colors: [
                  Colors.orange,
                  Colors.deepOrange
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
