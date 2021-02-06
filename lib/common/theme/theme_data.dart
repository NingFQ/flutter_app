
import 'package:flutter/material.dart';

class AppThemeData {

  // 字号
  static final double _titleFontSize = 18;

  // 亮色主题
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: Colors.white,
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.black,
        fontSize: _titleFontSize,
        fontWeight: FontWeight.w500
      )
    ),
    textTheme: TextTheme(
      // body1: TextStyle(color: Colors.red)
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 2,
      brightness: Brightness.light
    ),
  );


  // 暗黑主题
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    primarySwatch: Colors.pink,
    primaryTextTheme: TextTheme(
      title: TextStyle(
          color: Colors.white,
          fontSize: _titleFontSize,
          fontWeight: FontWeight.w500
      )
    ),
    textTheme: TextTheme(
      // body1: TextStyle(color: Colors.red)
    ),
    appBarTheme: AppBarTheme(
        color: Colors.black87,
        elevation: 2,
        brightness: Brightness.dark
    ),
  );
}