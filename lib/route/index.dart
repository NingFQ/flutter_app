
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/route/demo_router.dart';

// Index Pages

// Goods Pages

// Cart Pages

// Mine Pages

class DemoRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // 主页面
  Map<String,WidgetBuilder> appRoutes = {
    '/': (content, {arguments}) => new MyApp(),
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

