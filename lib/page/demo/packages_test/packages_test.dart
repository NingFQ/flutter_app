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
      )
    );
  }
}
