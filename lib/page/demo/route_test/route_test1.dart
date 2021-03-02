import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/route_test/route_test2.dart';

class RouteTest1 extends StatefulWidget {
  @override
  _RouteTest1State createState() => _RouteTest1State();
}

class _RouteTest1State extends State<RouteTest1> {

  String str = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由1'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          onPressed: () async{
            var result = await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RouteTest2(text: 'Route1传给Route2');
                }
            )).then((data) {
              setState(() {
                str = '==返回参数==$data';
              });
            });
          },
          child: Text('跳转Route2$str'),
        ),
      ),
    );
  }
}

