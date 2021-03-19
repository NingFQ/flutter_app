import 'package:flutter/material.dart';

class TextRichTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextRich'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '网址：'
                  ),
                  TextSpan(
                    text: 'www.baidu.com',
                    style: TextStyle(
                      color: Colors.blue
                    )
                  )
                ]
              )
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  // colors: <Color>[Colors.yellow, Colors.deepOrange],
                  // tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Text('Hello World',style: TextStyle(fontSize: 30),),
            ),
            Text(
              '${'aaaaa\n换行\t\t\t\t\t\tdede'}'
            )
          ],
        ),
      ),
    );
  }
}
