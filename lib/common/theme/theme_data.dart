
import 'package:flutter/material.dart';

class AppThemeData {

  // 字号
  static final double _titleFontSize = 18;

  // 亮色主题
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    primaryColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: _titleFontSize,
        fontWeight: FontWeight.w500
      )
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 2,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );


  // 暗黑主题
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    primarySwatch: Colors.pink,
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: _titleFontSize,
        fontWeight: FontWeight.w500
      )
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 2,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(
          color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}