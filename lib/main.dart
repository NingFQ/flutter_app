import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/cart/cart_page.dart';
import 'package:flutter_app/page/demo/demo_page.dart';
import 'package:flutter_app/page/goods/goods_page.dart';
import 'package:flutter_app/page/index/index_page.dart';
import 'package:flutter_app/page/mine/mine_page.dart';
import 'package:flutter_app/route/index.dart';
import 'dart:async';

import 'common/untils/network_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      // showPerformanceOverlay: true,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // initialRoute: '/',
      home: MyHomePage(),
      // routes: DemoRouter.demoRoutes,
      onGenerateRoute: DemoRouter().onGenerateRoute,
      navigatorKey: DemoRouter.navigatorKey,
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

  int currentIndex = 0;
  
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
          NewWork.networkType = 'wifi';
          NewWork.networkConnect = true;
          break;
        case ConnectivityResult.mobile:
          NewWork.networkType = 'mobile';
          NewWork.networkConnect = true;
          break;
        case ConnectivityResult.none:
          NewWork.networkType = 'none';
          NewWork.networkConnect = false;
          break;
      }
    });
  }

  @override
  dispose() {
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
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.loyalty),
              title: Text('商铺')
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


