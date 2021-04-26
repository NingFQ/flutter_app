import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation Test'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'animationTest1');
                  },
                  child: Text(
                    'TEST 1'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'animationTest2');
                  },
                  child: Text(
                    'TEST 2'
                  ),
                ),
              ],
            )
        )
    );
  }
}
