import 'package:flutter/material.dart';
import 'package:flutter_app/common/tab_bar/custom_canvas.dart';
import 'package:flutter_app/common/tab_bar/custom_indicator.dart';

class TabStyleTest extends StatefulWidget {
  @override
  _TabStyleTestState createState() => _TabStyleTestState();
}

class _TabStyleTestState extends State<TabStyleTest>  with SingleTickerProviderStateMixin{

  List testTabs = ['语文','数学','英语英语','政治','体育','生物','化学','物理','美术'];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: testTabs.length,vsync: this)
      ..addListener(() {
        if(_controller.index.toDouble() == _controller.animation.value){
          print('tab 切换了');
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Style 2'),
        bottom: TabBar(
            controller: _controller,
            tabs: testTabs.map((item) {
              return Tab(
                text: '$item',
              );
            }).toList(),
            isScrollable: true,
            indicator: ACETabBarIndicator(
                type: ACETabBarIndicatorType.roundLine,
                height: 12
            ),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 0,
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blue, // 不生效
                fontWeight: FontWeight.bold
            ),
            labelColor: Colors.yellow,
            // labelPadding: EdgeInsets.only(top: 0,bottom: 0,left: 0,right: 0),
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(
                fontSize: 16
            ),
            onTap: (index) {
              print('ontap=======$index');
            }
        ),
      ),
      body: Container(
        // padding: EdgeInsets.all(10),
        child: TabBarView(
          controller: _controller,
          children: testTabs.map((item) {
            return Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: CustomPaint(
                        painter: MyCustomCanvas(type: MyCanvasType.Circle)
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: CustomPaint(
                        painter: MyCustomCanvas(type: MyCanvasType.LineRound)
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: CustomPaint(
                          painter: MyCustomCanvas(type: MyCanvasType.LineRect)
                      ),
                    )
                  ],
                ),
              )
            );
          }).toList(),
        ),
      ),
    );
  }
}
