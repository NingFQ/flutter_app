import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/theme/theme_data.dart';
import 'package:flutter_app/common/widgets/error_page.dart';
import 'package:flutter_app/page/cart/cart_page.dart';
import 'package:flutter_app/page/demo/demo_page.dart';
import 'package:flutter_app/page/goods/goods_page.dart';
import 'package:flutter_app/page/index/index_page.dart';
import 'package:flutter_app/page/mine/mine_page.dart';
import 'package:flutter_app/route/index.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'dart:async';

import 'common/untils/network_class.dart';

void main ()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final double flutterScreenWidth = 750;
  final double flutterScreenHeight = 1334;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(flutterScreenWidth,flutterScreenHeight),
      allowFontScaling: false,
      builder: ()=> MaterialApp(
        title: 'Flutter Demo',
        // debugShowMaterialGrid: true,
        // showSemanticsDebugger: true,
        // showPerformanceOverlay: true,
        // theme: AppThemeColor.getThemeData('blue'),
        theme: AppThemeData.lightTheme,
        initialRoute: '/',
        home: MyHomePage(),
        onUnknownRoute: (RouteSettings setting) {
          String name = setting.name;
          print("未匹配到路由:$name");
          return new MaterialPageRoute(builder: (context) {
            return ErrorPage();
          });
        },
        // routes: DemoRouter.demoRoutes,
        onGenerateRoute: DemoRouter().onGenerateRoute,
        navigatorKey: DemoRouter.navigatorKey,
        builder: (BuildContext context, Widget child) {
          return FlutterSmartDialog(child: child);
        },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {            
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  int currentIndex = 4;

  List pages = [
    IndexPage(),
    GoodsPage(),
    CartPage(),
    MinePage(),
    DemoPage()
  ];

  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      switch (result) {
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
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              title: Text('分类')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              title: Text('购物车')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Demo')
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}


