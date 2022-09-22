import 'package:flutter/material.dart';
import 'package:flutter_app/common/provider/system_theme.dart';
import 'package:flutter_app/common/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEMO'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () async {
              showBottomBar(
                context,
                [
                  {'key': 'light', 'title': '浅色', 'viceTitle': 'LIGHT'},
                  {'key': 'dark', 'title': '深色', 'viceTitle': 'DARK'}
                ],
                callBack: (item) => Provider.of<SystemThemeProvider>(
                  context,
                  listen: false,
                ).switchTheme(item),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => routePush('eventTest'),
                      child: Text('事件广播'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('proportionPaint'),
                      child: Text('Canvas比例图'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('photoView'),
                      child: Text('图片预览'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('networkMonitor'),
                      child: Text('网络监听'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('smartDialog'),
                      child: Text('智能Toast'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('recordMp3AudioPlay'),
                      child: Text('录音record_mp3'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('recorderAudioPlay'),
                      child: Text('录音recorder'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('tabStyleTest'),
                      child: Text('TabBar'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('customScrollViewTest'),
                      child: Text('CustomScroll'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('NestedScrollView'),
                      child: Text('NestedScroll'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('scrollControllerTest'),
                      child: Text('ScrollController'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('scrollPositionRecord'),
                      child: Text('Page Storage'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('scrollAddListener'),
                      child: Text('scrollAddListener'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('animationTest1'),
                      child: Text('Tween动画'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('animationTest2'),
                      child: Text('Curve动画'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('inheritedTest'),
                      child: Text('Inherited'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('futureBuildTest'),
                      child: Text('FutureBuilder'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('streamBuildTest'),
                      child: Text('StreamBuilder'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('gestureDragTest'),
                      child: Text('Gesture Drag'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('notificationTest'),
                      child: Text('Notification'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('iconFontText'),
                      child: Text('IconFont'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('screenCapture'),
                      child: Text('截屏'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('webSocketTest'),
                      child: Text('Web Socket'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('loadingBtn'),
                      child: Text('Loading Btn'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('getXCounter'),
                      child: Text('GetX Easy'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('getXObjPage'),
                      child: Text('GetX Obj'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('pageOnePage'),
                      child: Text('GetX跨页面'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('counterProPage'),
                      child: Text('GetX进阶'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('listApi'),
                      child: Text('ListApi'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('IndexedStackPage'),
                      child: Text('IndexedStack'),
                    ),
                    ElevatedButton(
                      onPressed: () => routePush('skeletonText'),
                      child: Text('Skeleton'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void routePush(String name) {
    Navigator.pushNamed(context, name);
  }
}
