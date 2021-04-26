import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/function/components/class_test.dart';

class UntilsPage extends StatefulWidget {
  @override
  _UntilsPageState createState() => _UntilsPageState();
}

class _UntilsPageState extends State<UntilsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('函数'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                ClassTest c1 = new ClassTest('张三',90);
                c1.printInfo();
                c1.execRun();
                print(c1.maxAge);
                ClassTest c2 = new ClassTest('李四',10);
                c2.printInfo();
                ClassTest c3 = new ClassTest.defaultFn();
                print(c3);
              },
              child: Text(
                'Class Test'
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'eventTest');
              },
              child: Text(
                  '事件广播'
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'proportionPaint');
              },
              child: Text(
                  '绘制比例图'
              ),
            )
          ],
        ),
      )
    );
  }
}

