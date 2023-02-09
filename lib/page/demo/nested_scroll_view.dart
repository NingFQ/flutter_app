import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class NestedScrollViewTest extends StatefulWidget {
  const NestedScrollViewTest({
    Key key,
  }) : super(key: key);

  @override
  State<NestedScrollViewTest> createState() => _NestedScrollViewTestState();
}

class _NestedScrollViewTestState extends State<NestedScrollViewTest>
    with TickerProviderStateMixin {
  TabController _tabController;
    ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 230.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('复仇者联盟'),
                background: Image.network(
                  'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    height: 70,
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this._tabController,
                  tabs: <Widget>[
                    Tab(text: '111'),
                    Tab(text: '222'),
                    Tab(text: '333'),
                    Tab(text: '444'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: this._tabController,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 2000,
                color: Colors.blueAccent,
                alignment: Alignment.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: EasyRefresh(
                onRefresh: () async {},
                onLoad: () async {},
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      color: Colors.primaries[index % Colors.primaries.length],
                      alignment: Alignment.center,
                      child: Text(
                        '$index',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ),
            Container(
              color: Colors.pinkAccent,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
