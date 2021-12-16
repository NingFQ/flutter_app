import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class NetWork {
  // 当前网络类型
  static String networkType;
  // 当前网络连接状态
  static bool networkConnect;
  // 显示网络提示弹窗
  static void showNetWorkHint(BuildContext context) {
    SmartDialog.showToast(
      '',
      alignment: Alignment.topCenter,
      isDefaultDismissType: false,
      time: Duration(milliseconds: 3000),
      widget: buildToastWidget(context),
    );
  }

  // 关闭网络提示弹窗
  static void hideNetWorkHint() {
    SmartDialog.dismiss();
  }
}

// 网络提示弹窗样式
Widget buildToastWidget(context) {
  return Align(
    alignment: Alignment.topCenter,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, 'noneWeb').then((value) => () async {
              var connectivityResult =
                  await (Connectivity().checkConnectivity());
              print('res======${connectivityResult.toString()}');
              switch (connectivityResult) {
                case ConnectivityResult.wifi:
                  NetWork.networkType = 'wifi';
                  NetWork.networkConnect = true;
                  NetWork.hideNetWorkHint();
                  break;
                case ConnectivityResult.mobile:
                  NetWork.networkType = 'mobile';
                  NetWork.networkConnect = true;
                  NetWork.hideNetWorkHint();
                  break;
                case ConnectivityResult.none:
                  NetWork.networkType = 'none';
                  NetWork.networkConnect = false;
                  NetWork.showNetWorkHint(context);
                  break;
              }
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 100.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
        decoration: BoxDecoration(
          color: Color(0xFFFCF2F2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/default/web_warning.png',
              width: 25.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              '网络不给力，请检查网络设置',
              style: TextStyle(
                color: Color(0xFFE16560),
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
