import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/provider/back_to_top.dart';
import 'package:flutter_app/common/untils/events.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  ScrollController _controller;
  StreamSubscription actionSubscription;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
    ..addListener(() {
      if (_controller.offset > 100.0) {
        Provider.of<BackToTopProvider>(context, listen: false).changeIcon();
      } else {
        Provider.of<BackToTopProvider>(context, listen: false).restoreIcon();
      }
    });
    actionSubscription = eventBus.on<RefreshIndex>().listen((event){
      SmartDialog.showToast('刷新',alignment: Alignment.topCenter);
      _controller.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeInSine);
    });
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
        title: Text('首页'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                Container(
                  color: Colors.green,
                  height: 0.5.sh,
                ),
                Container(
                  color: Colors.red,
                  height: 0.5.sh,
                ),
                Container(
                  color: Colors.greenAccent,
                  height: 0.5.sh,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
