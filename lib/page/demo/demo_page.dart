import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/network_dialog.dart';

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
          actionsIconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add,color: Colors.white,),
              onPressed: () async{
                Future.wait([
                  Future.delayed(new Duration(seconds: 2),() {
                    return 'world';
                  }),
                  Future.delayed(new Duration(seconds: 2),() {
                    return 'hello';
                  }),
                ]).then((data){
                  print(data);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.apps,color: Colors.white,),
              onPressed: () {

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
                      '函数'
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
                    // Navigator.pushNamed(context,'widgetTestIndex');
                    showNetWorkTip(context);
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
}
