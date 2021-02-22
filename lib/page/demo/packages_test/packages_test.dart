import 'package:flutter/material.dart';

class PackagesTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件测试'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context,'englishWord');
              },
              child: Text(
                '自动生成英文单词'
              ),
            ),
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
                'smart_dialog'
              ),
            ),
          ],
        )
      )
    );
  }
}
