import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenCapture extends StatefulWidget {
  const ScreenCapture({Key key}) : super(key: key);

  @override
  _ScreenCaptureState createState() => _ScreenCaptureState();
}

class _ScreenCaptureState extends State<ScreenCapture> {
  GlobalKey rootWidgetKey = GlobalKey();
  List<Uint8List> images = List();
  Future<Uint8List> _capturePng() async {
    //TODO 进行截图
    try {
      RenderRepaintBoundary boundary = rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.add(pngBytes);
      setState(() {

      });
      return pngBytes;//这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: rootWidgetKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('截屏'),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
              "https://th.bing.com/th/id/R9d17d28183f39907a04ec2a54e3f8dd3?rik=xlD68Zj9qfDkew&riu=http%3a%2f%2fpicture.ik123.com%2fuploads%2fallimg%2f181027%2f12-1Q02G45605.gif&ehk=AM3vXI49u9hdwKoTFwoUW2NSbVnznD8HGGKMUe5mXVU%3d&risl=&pid=ImgRaw",
              width: double.infinity,
              height: 300,
            ),
            FlatButton(
              onPressed: () {
                this._capturePng();
              },
              child: Text("全屏截图"),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Image.memory(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
