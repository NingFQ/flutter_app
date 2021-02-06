import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDialog extends Dialog {
  /*
   * 为了方便代码维护 key值尽量统一
   * album 相册选择照片
   * photograph 相机拍照
   * record 录制视频
   * ...
   */
  final List buttons; // 生成操作的按钮集合

  final Function callback; // 回调函数


  CustomDialog({
    Key key,
    @required this.buttons,
    this.callback,
  }) : super(key: key);

  @override

  Widget build(BuildContext context) {

    final double paddingBottom = MediaQuery.of(context).padding.bottom;

    // 公共样式
    final itemStyle = TextStyle(
        fontSize: 15,
        color: Color(0xFF333333),
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none
    );
    // 取消按钮 通用
    Widget cancelBtn = GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        callback('cancel');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: paddingBottom),
        height: 65 + paddingBottom,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 10,
                    color: Color(0xFFF8F8F8)
                )
            )
        ),
        child: Center(
          child: Text('取消',style: itemStyle),
        ),
      ),
    );
    // 自定义操作按钮
    List<Widget> btnsContainerWidget() {
      int len = buttons.length;
      List<Widget> btnWidgetList = [];// 循环生成按钮的容器
      for(var i = 0;i < len;i ++){
        btnWidgetList.add(
            GestureDetector(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                    border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                          color: i == len - 1 ? Colors.transparent : Color(0xFFEEEEEE), // 最后一个没有底边框
                        )
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(buttons[i]['title'],style: itemStyle),
                    buttons[i]['viceTitle'] == null ? Container() : Text(buttons[i]['viceTitle'],style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 11,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal
                    ))
                  ],
                ),
              ),
              onTap: () {
                // 返回操作按钮的Key值
                Navigator.of(context).pop();
                if (buttons[i]['number'] != null) {
                  callback(buttons[i]['key'], buttons[i]['number']);
                } else {
                  callback(buttons[i]['key']);
                }
              },
            )
        );
      }
      // btnWidgetList.add(cancelBtn);
      return btnWidgetList;
    }
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 65 + paddingBottom),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: btnsContainerWidget()
            ),
          ),
        ),
        Positioned(
            left: 0,
            bottom: 0,
            child: cancelBtn
        )
      ],
    );
  }
}
/*
 * 显示底部弹出框
 * context 显示loading的实例
 * mediaSelected 回调函数
 */
void showBottomBar(context,List buttons,{Function callBack}) {
  showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft:  Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      builder: (BuildContext context) {
        return CustomDialog(buttons: buttons,callback: callBack,);
      }
  );
}