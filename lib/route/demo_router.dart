
// DEMO PAGES
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/function/untils.dart';
import 'package:flutter_app/page/demo/packages_test/components/network_monitor.dart';
import 'package:flutter_app/page/demo/function/components/event_test/event_test.dart';
import 'package:flutter_app/page/demo/packages_test/packages_test.dart';
import 'package:flutter_app/page/demo/packages_test/components/photo_view.dart';
import 'package:flutter_app/page/demo/route_test/route_test1.dart';
import 'package:flutter_app/page/demo/widget_test/components/scroll_stack.dart';
import 'package:flutter_app/page/demo/widget_test/components/tab_style.dart';
import 'package:flutter_app/page/demo/widget_test/components/tab_style2.dart';
import 'package:flutter_app/page/demo/widget_test/components/text_rich.dart';
import 'package:flutter_app/page/demo/widget_test/widget_test_index.dart';
import 'package:flutter_app/page/demo/packages_test/components/english_word.dart';



// demo
Map<String,WidgetBuilder> demoRoutes = {
  'untilPage': (content,{arguments}) => new UntilsPage(),
  'eventTest': (content,{arguments}) => new EventTest(),
  'routeTest': (content,{arguments}) => new RouteTest1(),
  'packagesTest': (content,{arguments}) => new PackagesTest(),
  'widgetTestIndex': (content,{arguments}) => new WidgetTestIndex(),
  'textRichTest': (content,{arguments}) => new TextRichTest(),
  'englishWord': (content,{arguments}) => new EnglishWord(),
  'photoView': (content,{arguments}) => new PhotoView(),// 图片预览
  'networkMonitor': (content,{arguments}) => new NetworkMonitor(),// 网络监听
  'tabStyleTest': (content,{arguments}) => new TabStyleTest(),
  'tabStyleTest2': (content,{arguments}) => new TabStyleTest2(),
  'scrollStack': (context,{arguments}) => new ScrollStack(),
};