import 'package:flutter/material.dart';

class RouteTest2 extends StatelessWidget {
  RouteTest2({Key key,@required this.text}):super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由2'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context,'Route2返回参数'),
          child: Text('$text'),
        ),
      ),
    );
  }
}
