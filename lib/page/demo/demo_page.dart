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
                          onPressed: () {
                            Navigator.pushNamed(context, 'eventTest');
                          },
                          child: Text(
                              '事件广播'
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'proportionPaint');
                          },
                          child: Text(
                              'Canvas绘制比例图'
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'photoView');
                            },
                            child: Text(
                                '图片预览'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'networkMonitor');
                            },
                            child: Text(
                                '网络监听'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'smartDialog');
                            },
                            child: Text(
                                '智能Toast'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'recordMp3AudioPlay');
                            },
                            child: Text(
                                '音频录制record_mp3版'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'recorderAudioPlay');
                            },
                            child: Text(
                                '音频录制recorder版'
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'textRichTest');
                            },
                            child: Text(
                                'Rich Text'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'tabStyleTest');
                            },
                            child: Text(
                                'Tab Test'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'scrollStack');
                            },
                            child: Text(
                                'Scroll Stack'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'customScrollViewTest');
                            },
                            child: Text(
                                'CustomScroll'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'scrollControllerTest');
                            },
                            child: Text(
                                'ScrollController'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'scrollPositionRecord');
                            },
                            child: Text(
                                'Page Storage'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'scrollAddListener');
                            },
                            child: Text(
                                'scrollAddListener'
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'animationTest1');
                            },
                            child: Text(
                                '动画1'
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context,'animationTest2');
                            },
                            child: Text(
                                '动画2'
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}
