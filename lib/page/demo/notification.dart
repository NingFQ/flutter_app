import 'package:flutter/material.dart';

class NotificationTest extends StatefulWidget {
  @override
  _NotificationTestState createState() => _NotificationTestState();
}

class _NotificationTestState extends State<NotificationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NotificationListener(
        // ignore: missing_return
        onNotification: (notification){
          switch (notification.runtimeType){
            case ScrollStartNotification: print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滚动到边界"); break;
          }
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"),);
            }
        ),
      ),
    );
  }
}
