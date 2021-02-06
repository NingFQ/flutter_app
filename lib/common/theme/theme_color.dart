import 'package:flutter/material.dart';

Map materialColor = { // 主副颜色
  'purple': {
    "primaryColor": 0xFF7B1FA2,
    "primaryColorLight": 0xFF9C27B0,
  },
  'pink': {
    "primaryColor": 0xFFc2185b,
    "primaryColorLight": 0xFFd81b60,
  },
  'deepPink': {
    "primaryColor": 0xFFf50057,
    "primaryColorLight": 0xFFe91e63,
  },
  'blue': {
    "primaryColor": 0xFF1976D2,
    "primaryColorLight": 0xFF2196F3,
  },
};

class AppThemeColor {
  static Map mainColor = materialColor['purple'];   // 默认颜色
  static getThemeData(String theme) {  // 获取theme方法： getThemeData();
    mainColor = materialColor[theme];  // 设置主题颜色
    ThemeData themData = ThemeData(
      // scaffoldBackgroundColor: Colors.red, // 页面的背景颜色

      primaryColor: Color(mainColor["primaryColor"]), // 主颜色
      primaryColorLight: Color(mainColor["primaryColorLight"]),
      // 按钮颜色
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textTheme: ButtonTextTheme.normal,
        buttonColor: Color(mainColor["primaryColor"]),
      ),
      // 小部件的前景色（旋钮，文本，过度滚动边缘效果等）。
      accentColor: Color(mainColor["primaryColor"]),

      // appbar样式
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),

      // 图标样式
      iconTheme: IconThemeData(
        color: Color(mainColor["primaryColor"]),
      ),

      // 用于自定义对话框形状的主题。
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
        ),
      ),
    );
    return themData;
  }
}