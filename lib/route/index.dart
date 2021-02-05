import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
// DEMO PAGES
import 'package:flutter_app/page/demo/function/untils.dart';
import 'package:flutter_app/page/demo/packages_test/network_monitor.dart';
import 'package:flutter_app/page/demo/packages_test/packages_test.dart';
import 'package:flutter_app/page/demo/packages_test/photo_view.dart';
import 'package:flutter_app/page/demo/route_test/route_test1.dart';
import 'package:flutter_app/page/demo/widget_test/widget_test_index.dart';
import 'package:flutter_app/page/demo/packages_test/english_word.dart';
import 'package:flutter_app/page/demo/widget_test/widget_components/scroll_stack.dart';
import 'package:flutter_app/page/demo/widget_test/widget_components/tab_style.dart';
import 'package:flutter_app/page/demo/widget_test/widget_components/tab_style2.dart';
import 'package:flutter_app/page/demo/widget_test/widget_components/text_rich.dart';



class DemoRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // 主页面
  Map<String,WidgetBuilder> appRoutes = {
    '/': (content, {arguments}) => new MyApp(),
  };
  // 首页
  Map<String,WidgetBuilder> demoRoutes = {
    'untilPage': (content,{arguments}) => new UntilsPage(),
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
  // 首页
  Map<String,WidgetBuilder> indexRoutes = {
  };
  // 商铺
  Map<String,WidgetBuilder> goodsRoutes = {
  };
  // 购物车
  Map<String,WidgetBuilder> cartRoutes = {
  };
  // 个人中心
  Map<String,WidgetBuilder> mineRoutes = {
  };

  // 默认构造函数
  DemoRouter() {
    appRoutes.addAll(demoRoutes);
    appRoutes.addAll(indexRoutes);
    appRoutes.addAll(goodsRoutes);
    appRoutes.addAll(cartRoutes);
    appRoutes.addAll(mineRoutes);
  }



  Route onGenerateRoute(RouteSettings settings) {
    // 统一处理
    final String name = settings.name;
    final Function pageContentBuilder = appRoutes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            settings: RouteSettings(name: name),
            builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
        );
        return route;
      } else {
        final Route route = MaterialPageRoute(
            settings: RouteSettings(name: name),
            builder: (context) => pageContentBuilder(context)
        );
        return route;
      }
    } else {
      return null;
    }
  }
}

