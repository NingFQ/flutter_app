import 'package:flutter/material.dart';
import 'package:flutter_app/common/img_view/img_view_ExtendedImage.dart';
import 'package:flutter_app/common/img_view/img_view_SimpleScreen.dart';
import 'package:flutter_app/route/index.dart';
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
    'assets/img/img4.jpeg',
    'assets/img/img5.jpeg',
    'assets/img/img6.jpeg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片预览'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'PhotoViewSimpleScreen',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                  Wrap(
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
                          height: MediaQuery.of(context).size.width / 3,
                          child: Image.asset(item,fit: BoxFit.cover,),
                        ),
                      );
                    }).toList()
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'PhotoViewExtendImage',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                  Wrap(
                    children: imgList.asMap().keys.map((index){
                      return GestureDetector(
                        onTap: () {
                          DemoRouter.navigatorKey.currentState.push(ScaleRoute(
                              page: AsrImageView(arguments: {
                                'paramsImgs': imgList,
                                'currentIndex': index
                              })
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                          child: Image.asset(imgList[index],fit: BoxFit.cover,),
                        ),
                      );
                    }).toList()
                  )
                ],
              ),
            ],
          ),
        )
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