import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter_app/common/widgets/bottom_sheet.dart';
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
  bool paginationIndex = true;// 是否显示顶部进度提示器
  bool operatingTools = true;// 是否显示右上角操作按钮
  int currentIndex = 0;// 当前下标
  List paramsImgs = [];// 图片数组
  List keys = [];// 图片数组
  bool isWater = false;

  // 下标进度指示器样式
  TextStyle _style = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal
  );

  @override
  void initState() {
    super.initState();
    if (widget.arguments != null) {
      paramsImgs = widget.arguments['paramsImgs']??[];
      paginationIndex = widget.arguments['paginationIndex']??false;
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
    double top = MediaQuery.of(context).padding.top;
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
          operatingTools ? Positioned(
            top: top,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showBottomBar(
                    context,
                    [{
                      'title':'保存图片','key': 'savePhoto'
                    }],
                    callBack: handelImgsFile,
                  );
                });

              },
              child: Container(
                width: 40,
                height: 40,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ) : Container(),
          paginationDots&&paramsImgs.length>1 ? Positioned(
            bottom: 20.w,
            left: 0,
            child: _buildPaginationDots(),
          ) : Container(),
        ],
      ),
    );
  }
  void handelImgsFile(key) async{
    switch (key) {
      case 'savePhoto':

        break;
      default:
    }

  }

  // 图片显示容器
  List<Widget>  _buildImgContainer() {
    List<Widget> widgets=[];
    keys.clear();
    for(int i=0;i<paramsImgs.length;i++){
      String imgUrl = paramsImgs[i];
      GlobalKey _repaintKey = GlobalKey();
      keys.add(_repaintKey);
      if (imgUrl == null) {
        imgUrl = "assets/img/default/practice_default_img.png";
      }
      Widget imageLoader;
      var _config =  GestureConfig(
        minScale: 0.9,
        animationMinScale: 0.7,
        maxScale: 3.0,
        animationMaxScale: 3.5,
        speed: 1.0,
        inertialSpeed: 100.0,
        initialScale: 1.0,
        inPageView: true,
      );
      // 网络路径和本地路径的加载区别
      if (RegExp('http*').hasMatch(imgUrl)) {
        imageLoader = ExtendedImage.network(
            imgUrl,
            cache: true,
            scale: 1.0,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return _config;
            }
        );
      } else {
        imageLoader = ExtendedImage.file(
            File(imgUrl),
            scale: 1.0,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) {
              return _config;
            }
        );
      }
      widgets.add(
          GestureDetector(
            onTap: (){
              // AsrRouter.navigatorKey.currentState.pop(ScaleRoute(page: AsrImageView()));
            },
            child: Center(
                child: RepaintBoundary(
                  key: _repaintKey,
                  child: Stack(
                    children: <Widget>[
                      imageLoader,
                      Visibility(
                        visible: widget.arguments['userName']!=null&&isWater,
                        child: Positioned(
                          right: 10,
                          bottom: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Image.asset('assets/img/default/jzkj_water.png',height: 15,fit: BoxFit.fitHeight,),
                              SizedBox(height: 4,),
                              Text('@'+ (widget.arguments['userName']??''),style: TextStyle(color: Colors.white,fontSize: 10,shadows:[
                                Shadow(color: Color(0xFF666666), offset: Offset(3, 3), blurRadius: 3)
                              ] ),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          )
      );
    }

    return widgets;
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

