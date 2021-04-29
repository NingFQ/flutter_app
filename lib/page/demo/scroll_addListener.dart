import 'package:flutter/material.dart';

class ScrollAddListener extends StatefulWidget {
  @override
  _ScrollAddListenerState createState() => _ScrollAddListenerState();
}

class _ScrollAddListenerState extends State<ScrollAddListener> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar( //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print('notification======$notification');
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return true; //放开此行注释后，滚动条将失效
        },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  }
              ),
              CircleAvatar(  //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
