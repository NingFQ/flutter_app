import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter_app/page/demo/packages/photo_view.dart';
import 'package:flutter_app/route/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AsrImageView extends StatefulWidget {
  final arguments;
  AsrImageView({Key key,this.arguments}) : super(key : key);
  @override
  _AsrImageViewState createState() => _AsrImageViewState();
}

class _AsrImageViewState extends State<AsrImageView> {

  PageController _controller;// PageView的控制器
  bool paginationDots = false;// 是否显示底部进度提示器
  bool operatingTools = true;// 是否显示右上角操作按钮
  int currentIndex = 0;// 当前下标
  List paramsImgs = [];// 图片数组
  List keys = [];// 图片数组
  bool isWater = false;

  @override
  void initState() {
    super.initState();
    if (widget.arguments != null) {
      paramsImgs = widget.arguments['paramsImgs']??[];
      paginationDots = widget.arguments['paginationDots']??true;
      operatingTools = widget.arguments['paginationDots']??true;
      currentIndex = widget.arguments['currentIndex']??0;
      _controller = new PageController(
        initialPage: currentIndex,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(0, 0, 0, 1),
            child: ExtendedImageGesturePageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: _buildImgContainer()
            )
          ),
          paginationDots&&paramsImgs.length>1 ? Positioned(
            bottom: 20.w + MediaQuery.of(context).padding.bottom,
            left: 0,
            child: _buildPaginationDots(),
          ) : Container(),
        ],
      ),
    );
  }


  // 图片显示容器
  List<Widget>  _buildImgContainer() {
    List<Widget> widgets=[];
    keys.clear();
    for(int i = 0;i < paramsImgs.length;i ++){
      String imgUrl = paramsImgs[i];
      GlobalKey _repaintKey = GlobalKey();
      keys.add(_repaintKey);
      Widget imageLoader;
      // 网络路径和本地路径的加载区别
      if (RegExp('http*').hasMatch(imgUrl)) {
        imageLoader = ExtendedImage.network(
            imgUrl,
            cache: true,
            scale: 1.0,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return buildConfig(1,imgUrl);
            }
        );
      }else if (RegExp('asset*').hasMatch(imgUrl)) {
        imageLoader = ExtendedImage.asset(
            imgUrl,
            scale: 1.0,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return buildConfig(2,imgUrl);
            }
        );
      } else {
        imageLoader = ExtendedImage.file(
            File(imgUrl),
            scale: 1.0,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return buildConfig(3,imgUrl);
            }
        );
      }
      widgets.add(
          GestureDetector(
            onTap: (){
              DemoRouter.navigatorKey.currentState.pop(ScaleRoute(page: AsrImageView()));
            },
            child: RepaintBoundary(
              key: _repaintKey,
              child: imageLoader
              // Container(
              //   width: 1.sw,
              //   height: 1.sh,
              //   color: Colors.blue,
              //   alignment: Alignment.topCenter,
              //   child: imageLoader,
              // ),
            )
          )
      );
    }
    return widgets;
  }

  // 构建配置
  buildConfig (int type,String imgUrl) {
    // 初始缩放值
    double initialScale = 1.0;
    // 获取图片宽高信息
    Image image = Image.asset(imgUrl);
    image.image.resolve(new ImageConfiguration()).addListener(
      new ImageStreamListener((ImageInfo info, bool _) {
        initialScale = info.image.height > 1.sw ? info.image.width / 1.sw : 1.0;
        print('图片信息=====宽度：${info.image.width}=====高度：${info.image.height}');
        print('屏幕宽度======${1.sw}====屏幕高度====${1.sh}');
        print('初始缩放比例=====$initialScale');
      })
    );
    return GestureConfig(
      minScale: 0.2,
      maxScale: 10.0,
      speed: 1.0,
      inertialSpeed: 100.0,
      initialScale: initialScale,
      inPageView: true,
    );
  }

  // 底部显示器
  Widget _buildPaginationDots() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: paramsImgs.asMap().keys.map<Widget>((i) {
          return Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                color: i == currentIndex ? Colors.white : Color.fromRGBO(225, 225, 225, 0.5)
            ),
          );
        }).toList(),
      ),
    );
  }
}

