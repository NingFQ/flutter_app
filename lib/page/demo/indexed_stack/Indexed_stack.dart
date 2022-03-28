import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/indexed_stack/page_details.dart';

/// IndexedStack 页面
class IndexedStackPage extends StatefulWidget {
  IndexedStackPage({Key key}) : super(key: key);

  @override
  _IndexedStackPageState createState() => _IndexedStackPageState();
}

class _IndexedStackPageState extends State<IndexedStackPage> {
  // 当前子项索引
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack'),
      ),
      body: IndexedStack(
        alignment: Alignment.center,
        // 设置当前索引
        index: currentIndex,
        children: [
          const PageDetails(title: '首页'),
          const PageDetails(title: '消息'),
          const PageDetails(title: '我的'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 当前索引和 IndexedStack 使用同一个变量
        currentIndex: currentIndex,
        // 导航子项集
        items: [
          // 导航子项
          BottomNavigationBarItem(
            // 图标
            icon: Icon(Icons.home),
            // 文字内容
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '我的',
          ),
        ],
        onTap: (value) {
          // 点击事件，用于改变当前索引，然后刷新
          currentIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
