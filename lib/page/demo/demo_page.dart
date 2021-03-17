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
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'untilPage');
                  },
                  child: Text(
                      '方法'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'routeTest');
                  },
                  child: Text(
                      '路由'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'packagesTest');
                  },
                  child: Text(
                      '插件'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,'widgetTestIndex');
                  },
                  child: Text(
                      '组件'
                  ),
                ),
              ],
            )
        )
    );
  }

  // //  操作回调
  // void actionCallBack(item) {
  //   Provider.of<SystemTheme>(context).switchTheme(item);
  // }
}
