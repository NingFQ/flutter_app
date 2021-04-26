import 'package:flutter/material.dart';

class WidgetTestIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Test'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'textRichTest');
                },
                child: Text(
                  '富文本'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'tabStyleTest');
                },
                child: Text(
                  'Tab Test'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'scrollStack');
                },
                child: Text(
                  'Scroll Stack'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'animationTest');
                },
                child: Text(
                    '动画'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'customScrollViewTest');
                },
                child: Text(
                    'CustomScroll'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'scrollControllerTest');
                },
                child: Text(
                    'ScrollController'
                ),
              ),
            ],
          )
      )
    );
  }
}
