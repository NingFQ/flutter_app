import 'package:flutter/material.dart';
import 'package:flutter_app/common/untils/network_class.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmartDialogWidget extends StatefulWidget {
  @override
  _SmartDialogWidgetState createState() => _SmartDialogWidgetState();
}

class _SmartDialogWidgetState extends State<SmartDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SmartDialog'),
      ),
      body: Container(
        width: 1.sw,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('网络提示 toast'),
              onPressed: () {
                NetWork.showNetWorkHint(context);
              },
            ),
            RaisedButton(
              child: Text('关闭网络提示 toast'),
              onPressed: () {
                SmartDialog.dismiss();
                // NetWork.hideNetWorkHint();
              },
            ),
            RaisedButton(
              child: Text('SmartDialog.show'),
              onPressed: () {
                SmartDialog.show(
                  alignmentTemp: Alignment.bottomCenter,
                  clickBgDismissTemp: true,
                  widget: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 300,
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('showLoading'),
              onPressed: () async{
                SmartDialog.showLoading();
                await Future.delayed(Duration(seconds: 2));
                SmartDialog.dismiss();
              },
            ),
          ],
        )
      ),
    );
  }
}


