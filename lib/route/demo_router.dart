
// DEMO PAGES
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/animation/animation_test1.dart';
import 'package:flutter_app/page/demo/animation/animation_test2.dart';
import 'package:flutter_app/page/demo/custom_scroll_view.dart';
import 'package:flutter_app/page/demo/event_test/event_test.dart';
import 'package:flutter_app/page/demo/future_builder_test.dart';
import 'package:flutter_app/page/demo/gesture_drag_test.dart';
import 'package:flutter_app/page/demo/getX/counter/view.dart';
import 'package:flutter_app/page/demo/getX/cross_page/page_one/view.dart';
import 'package:flutter_app/page/demo/getX/cross_page/page_two/view.dart';
import 'package:flutter_app/page/demo/icon_test.dart';
import 'package:flutter_app/page/demo/inherited_test.dart';
import 'package:flutter_app/page/demo/loading_btn.dart';
import 'package:flutter_app/page/demo/notification.dart';
import 'package:flutter_app/page/demo/page_storage_test/scroll_position_record.dart';
import 'package:flutter_app/page/demo/proportion_paint.dart';
import 'package:flutter_app/page/demo/packages/network_monitor/network_monitor.dart';
import 'package:flutter_app/page/demo/packages/photo_view.dart';
import 'package:flutter_app/page/demo/packages/record_mp3/record_mp3.dart';
import 'package:flutter_app/page/demo/packages/record_mp3/recorder_mp3.dart';
import 'package:flutter_app/page/demo/packages/smart_dialog.dart';
import 'package:flutter_app/page/demo/screen_capture.dart';
import 'package:flutter_app/page/demo/scroll_addListener.dart';
import 'package:flutter_app/page/demo/scroll_controller.dart';
import 'package:flutter_app/page/demo/stream_builder_test.dart';
import 'package:flutter_app/page/demo/tab_style.dart';
import 'package:flutter_app/page/demo/web_socket.dart';



// demo
Map<String,WidgetBuilder> demoRoutes = {
  // 方法
  'eventTest': (content,{arguments}) => new EventTest(),
  'proportionPaint': (content,{arguments}) => new ProportionPaint(),
  // 插件测试
  'photoView': (content,{arguments}) => new PhotoView(),// 图片预览
  'networkMonitor': (content,{arguments}) => new NetworkMonitor(),// 网络监听
  'smartDialog': (content,{arguments}) => new SmartDialogWidget(),// smart dialog
  // 'recorderAudioPlay': (content,{arguments}) => new RecorderAudioPlay(),// 音频录制
  // 'recordMp3AudioPlay': (content,{arguments}) => new RecordMp3AudioPlay(),// 音频录制
  // 组件测试
  'tabStyleTest': (content,{arguments}) => new TabStyleTest(),
  'customScrollViewTest': (context,{arguments}) => new CustomScrollViewTest(),// 滚动
  'scrollControllerTest': (context,{arguments}) => new ScrollControllerTest(),// 滚动
  'scrollPositionRecord': (context,{arguments}) => new ScrollPositionRecord(),// 滚动
  'scrollAddListener': (context,{arguments}) => new ScrollAddListener(),// 滚动
  'inheritedTest': (context,{arguments}) => new InheritedTest(),// InheritedWidget
  'futureBuildTest': (context,{arguments}) => new FutureBuildTest(),// FutureBuilder
  'streamBuildTest': (context,{arguments}) => new StreamBuildTest(),// StreamBuilder
  'gestureDragTest': (context,{arguments}) => new GestureDragTest(),// GestureDrag
  'notificationTest': (context,{arguments}) => new NotificationTest(),// Notification
  'iconFontText': (context,{arguments}) => new IconFontText(),// IconFontText
  'screenCapture': (context,{arguments}) => new ScreenCapture(),// 截屏
  'webSocketTest': (context,{arguments}) => new WebSocketTest(),// 层叠卡片
  'loadingBtn': (context,{arguments}) => new LoadingBtn(),// 层叠卡片
  // 动画测试
  'animationTest1': (context,{arguments}) => new AnimationTest1(),
  'animationTest2': (context,{arguments}) => new AnimationTest2(),
  // GetX计数器
  'getXCounter': (context,{arguments}) => new CounterPage(),
  // 跨页面
  'pageOnePage': (context,{arguments}) => new PageOnePage(),
  'pageTwoPage': (context,{arguments}) => new PageTwoPage(),
};