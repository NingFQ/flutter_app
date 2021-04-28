import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/widget/page_storage_test/page1.dart';
import 'package:flutter_app/page/demo/widget/page_storage_test/page2.dart';

class ScrollPositionRecord extends StatefulWidget {
  @override
  _ScrollPositionRecordState createState() => _ScrollPositionRecordState();
}

class TabViewList {
  String name;
  Widget child;
  TabViewList(this.name,this.child);
}

class _ScrollPositionRecordState extends State<ScrollPositionRecord> with TickerProviderStateMixin{

  List<TabViewList> tabList = [
    TabViewList('page1',new Page1(
      key: new PageStorageKey<String>('page1_key'),
    )),
    TabViewList('page2',new Page2()),
  ];

  TabController _controller;


  @override
  void initState() {
    _controller = TabController(length: tabList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动位置记录'),
        bottom: PreferredSize(
          child: TabBar(
            controller: _controller,
            tabs: tabList.map((TabViewList e) =>
              Tab(
                child: Text('${e.name}'
              )
            )).toList(),
          ),
          preferredSize: Size.fromHeight(30.0)
        ),
      ),
      body: TabBarView(controller: _controller,children: tabList.map((tab) => tab.child).toList()),
    );
  }
}
