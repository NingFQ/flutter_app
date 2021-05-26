import 'package:flutter/material.dart';

class IconFontText extends StatefulWidget {
  @override
  _IconFontTextState createState() => _IconFontTextState();
}

class _IconFontTextState extends State<IconFontText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Icon(IconData(0xe64b,fontFamily: 'iconfont',),color: Colors.orange,size: 40.0),
          Icon(IconData(0xe645,fontFamily: 'iconfont',),color: Colors.orange,size: 40.0),
        ],
      ),
    );
  }
}
