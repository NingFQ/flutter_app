import 'package:flutter/material.dart';

class CustomScrollViewTest extends StatefulWidget {
  @override
  _CustomScrollViewTestState createState() => _CustomScrollViewTestState();
}

class _CustomScrollViewTestState extends State<CustomScrollViewTest> {
  @override
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            pinned: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                "assets/img/img1.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.all(8.0),
          //   sliver: new SliverGrid(
          //     //Grid
          //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, //Grid按两列显示
          //       mainAxisSpacing: 10.0,
          //       crossAxisSpacing: 10.0,
          //       childAspectRatio: 4.0,
          //     ),
          //     delegate: new SliverChildBuilderDelegate(
          //       (BuildContext context, int index) {
          //         //创建子widget
          //         return new Container(
          //           alignment: Alignment.center,
          //           color: Colors.cyan[100 * (index % 9)],
          //           child: new Text('grid item $index'),
          //         );
          //       },
          //       childCount: 20,
          //     ),
          //   ),
          // ),
          //List
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建列表项
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              },
              childCount: 10, //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        "hello world",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 600;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
