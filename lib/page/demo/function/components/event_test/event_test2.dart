import 'package:flutter/material.dart';
import 'package:flutter_app/common/untils/events.dart';

class EventTest2 extends StatefulWidget {
  @override
  _EventTest2State createState() => _EventTest2State();
}

class _EventTest2State extends State<EventTest2> {

  String eventName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          color: Colors.deepOrange,
          child: Center(
            child: RaisedButton(
              onPressed: () {
                eventBus.fire(new ProductContentEvent('我收到广播事件了'));
              },
              child: Text(
                '发送广播'
              ),
            ),
          )
      )
    );
  }
}
