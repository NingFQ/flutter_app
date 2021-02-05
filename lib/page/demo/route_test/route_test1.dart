import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/route_test/route_test2.dart';

class RouteTest1 extends StatelessWidget {
  final String str = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由1'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () async{
            var result = await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return RouteTest2(text: 'Route1传给Route2');
              }
            )).then((data) {
              print('路由返回参数=====$data');
            });
          },
          child: Text('跳转Route2===$str'),
        ),
      ),
    );
  }
}

