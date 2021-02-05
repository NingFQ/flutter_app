import 'package:flutter/material.dart';


class NetworkDialog extends Dialog {

  NetworkDialog({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 215,
      height: 30,
      color: Color(0xFFFCF2F2),
      // child: Text(
      //   '网络不给力，请检查网络设置',
      //   style: TextStyle(
      //       color: Color(0xFFE16560),
      //       fontSize: 12
      //   ),
      // ),
    );
  }
}

var overlayState;
var overlayEntry;
void showNetWorkTip(context) {
  overlayState = Overlay.of(context);
  overlayEntry = new OverlayEntry(builder: (context) {
    return Container(
      width: 215,
      height: 30,
      color: Colors.transparent,
      // color: Color(0xFFFCF2F2),
      child: Text(
        '网络不给力，请检查网络设置',
        style: TextStyle(
            color: Color(0xFFE16560),
            fontSize: 12
        ),
      ),
    );
  });
  overlayState.insert(overlayEntry);
}