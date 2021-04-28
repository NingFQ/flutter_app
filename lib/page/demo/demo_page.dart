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
            icon: Icon(Icons.add,size: 30,),
            onPressed: () async{
              showBottomBar(
                context,
                [
                  {'key': 'light','title': '浅色','viceTitle': 'LIGHT'},
                  {'key': 'dark','title': '深色','viceTitle': 'DARK'}
                ],
                callBack: (item) => Provider.of<SystemThemeProvider>(context,listen: false).switchTheme(item)
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
                    RaisedButton(
                      onPressed: () => routePush('eventTest'),
                      child: Text(
                          '事件广播'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('proportionPaint'),
                      child: Text(
                          'Canvas绘制比例图'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('photoView'),
                      child: Text(
                          '图片预览'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('networkMonitor'),
                      child: Text(
                          '网络监听'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('smartDialog'),
                      child: Text(
                          '智能Toast'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('recordMp3AudioPlay'),
                      child: Text(
                          '音频录制record_mp3版'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('recorderAudioPlay'),
                      child: Text(
                          '音频录制recorder版'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('textRichTest'),
                      child: Text(
                          'Rich Text'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('tabStyleTest'),
                      child: Text(
                          'Tab Test'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('scrollStack'),
                      child: Text(
                          'Scroll Stack'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('customScrollViewTest'),
                      child: Text(
                          'CustomScroll'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('scrollControllerTest'),
                      child: Text(
                          'ScrollController'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('scrollPositionRecord'),
                      child: Text(
                          'Page Storage'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('scrollAddListener'),
                      child: Text(
                          'scrollAddListener'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('animationTest1'),
                      child: Text(
                          '动画1'
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => routePush('animationTest2'),
                      child: Text(
                          '动画2'
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }

  void routePush(String name) {
    Navigator.pushNamed(context, name);
  }
}
