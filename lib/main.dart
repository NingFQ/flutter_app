import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/provider/back_to_top.dart';
import 'package:flutter_app/common/provider/system_theme.dart';
import 'package:flutter_app/common/untils/events.dart';
import 'package:flutter_app/common/widgets/error_page.dart';
import 'package:flutter_app/page/cart/cart_page.dart';
import 'package:flutter_app/page/demo/demo_page.dart';
import 'package:flutter_app/page/goods/goods_page.dart';
import 'package:flutter_app/page/index/index_page.dart';
import 'package:flutter_app/page/mine/mine_page.dart';
import 'package:flutter_app/route/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'common/untils/network_class.dart';

void main ()=> runApp(MyApp());


class MyApp extends StatelessWidget {

  final double flutterScreenWidth = 750;
  final double flutterScreenHeight = 1334;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(flutterScreenWidth,flutterScreenHeight),
      builder: ()=> MultiProvider(
        providers: [
          ChangeNotifierProvider<SystemThemeProvider>( create: (_) => SystemThemeProvider(),),
          ChangeNotifierProvider<BackToTopProvider>( create: (_) => BackToTopProvider(),),

        ],
        child: Consumer<SystemThemeProvider>(
          builder: (context,systemTheme,_){
            return MaterialApp(
              title: 'Flutter Demo',
              // debugShowMaterialGrid: true,
              // showSemanticsDebugger: true,
              // showPerformanceOverlay: true,
              // theme: AppThemeColor.getThemeData('blue'),
              theme: systemTheme.currentTheme,
              initialRoute: '/',
              home: MyHomePage(),
              onUnknownRoute: (RouteSettings setting) {
                String name = setting.name;
                return new MaterialPageRoute(builder: (context) {
                  return ErrorPage();
                });
              },
              onGenerateRoute: DemoRouter().onGenerateRoute,
              navigatorKey: DemoRouter.navigatorKey,
              builder: (BuildContext context, Widget child) {
                return FlutterSmartDialog(child: child);
              },
            );
          },
        )
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
    var backToTopVM = Provider.of<BackToTopProvider>(context);
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
              icon: backToTopVM.currentIcon,
              label: '首页'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: '分类'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: '购物车'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Demo'
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0 && backToTopVM.shouldRefresh) {
              eventBus.fire(new RefreshIndex());
            } else {
              backToTopVM.restoreIcon();
            }
            currentIndex = index;
          });
        },
      ),
    );
  }
}


