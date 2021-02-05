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
                  'Tab Test 1'
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'tabStyleTest2');
                },
                child: Text(
                  'Tab Test 2'
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
            ],
          )
      )
    );
  }
}
