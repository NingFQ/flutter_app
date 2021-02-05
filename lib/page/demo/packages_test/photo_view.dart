import 'package:flutter/material.dart';
import 'package:flutter_app/common/img_view/img_view.dart';
import 'package:photo_view/photo_view.dart';

class PhotoView extends StatefulWidget {
  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {


  List<String> imgList = [
    'assets/img/img1.jpeg',
    'assets/img/img2.jpeg',
    'assets/img/img3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
      ),
      body: Container(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map<Widget>((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new ScaleRoute(page: PhotoViewSimpleScreen(
                    imageProvider: AssetImage(item),
                    heroTag: 'simple',
                  )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Image.asset(item),
                ),
              );
            }).toList()
          ),
        ),
      ),
    );
  }
}

// 路由动画
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page}): super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>page,transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) =>ScaleTransition(
    scale: animation,
    child: child,
  ),
  );
}