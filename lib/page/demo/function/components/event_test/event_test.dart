import 'package:flutter/material.dart';
import 'package:flutter_app/common/untils/events.dart';
import 'package:flutter_app/page/demo/function/components/event_test/event_test2.dart';

class EventTest extends StatefulWidget {
  @override
  _EventTestState createState() => _EventTestState();
}

class _EventTestState extends State<EventTest> {

  String eventName = '';
  var actionSubscription;
  @override
  void initState() {
    actionSubscription = eventBus.on<ProductContentEvent>().listen((event){
      setState(() {
        eventName = event.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    actionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件广播'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.black87,
              alignment: Alignment.center,
              child: Text(
                eventName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
                ),
              ),
            ),
            Expanded(
              child: EventTest2()
            ),
          ],
        ),
      ),
    );
  }
}
