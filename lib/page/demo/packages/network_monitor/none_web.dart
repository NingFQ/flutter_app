import 'package:flutter/material.dart';
import 'package:flutter_app/common/untils/network_class.dart';

class NoneWeb extends StatefulWidget {
  @override
  _NoneWebState createState() => _NoneWebState();
}

class _NoneWebState extends State<NoneWeb> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) => () {
    //   NetWork.hideNetWorkHint();
    // });
    Future.delayed(Duration(milliseconds: 100),() {
      NetWork.hideNetWorkHint();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络设置方法'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('没有网络'),
            Text('没有网络'),
            Text('没有网络'),
            Text('没有网络'),
          ],
        ),
      ),
    );
  }
}
