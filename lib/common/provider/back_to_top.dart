import 'package:flutter/material.dart';

class BackToTopProvider extends ChangeNotifier{
  Icon _currentIcon = Icon(Icons.home);// 默认图标
  bool _shouldRefresh = false;// 是否刷新

  Icon get currentIcon => _currentIcon;
  bool get shouldRefresh => _shouldRefresh;

  void changeIcon() {
    _currentIcon = Icon(Icons.arrow_upward);
    _shouldRefresh = true;
    notifyListeners();
  }

  void restoreIcon() {
    _currentIcon = Icon(Icons.home);
    _shouldRefresh = false;
    notifyListeners();
  }
}