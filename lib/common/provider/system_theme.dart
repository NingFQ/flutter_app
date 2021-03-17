import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme/theme_data.dart';

class SystemThemeProvider extends ChangeNotifier{
  // 默认亮色主题
  ThemeData currentTheme = AppThemeData.lightTheme;

  void switchTheme(String type) {
    switch (type) {
      case 'light':
        currentTheme = AppThemeData.lightTheme;
        notifyListeners();//通知所有听众进行刷新
        break;
      case 'dark':
        currentTheme = AppThemeData.darkTheme;
        notifyListeners();//通知所有听众进行刷新
        break;
    }
  }
}