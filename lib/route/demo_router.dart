
// DEMO PAGES
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/animation/animation_test1.dart';
import 'package:flutter_app/page/demo/animation/animation_test2.dart';
import 'package:flutter_app/page/demo/function/event_test/event_test.dart';
import 'package:flutter_app/page/demo/function/proportion_paint.dart';
import 'package:flutter_app/page/demo/packages/network_monitor.dart';
import 'package:flutter_app/page/demo/packages/photo_view.dart';
import 'package:flutter_app/page/demo/packages/record_mp3/record_mp3.dart';
import 'package:flutter_app/page/demo/packages/record_mp3/recorder_mp3.dart';
import 'package:flutter_app/page/demo/packages/smart_dialog.dart';
import 'package:flutter_app/page/demo/widget/custom_scroll_view.dart';
import 'package:flutter_app/page/demo/widget/none_web.dart';
import 'package:flutter_app/page/demo/widget/page_storage_test/scroll_position_record.dart';
import 'package:flutter_app/page/demo/widget/scroll_addListener.dart';
import 'package:flutter_app/page/demo/widget/scroll_controller.dart';
import 'package:flutter_app/page/demo/widget/scroll_stack.dart';
import 'package:flutter_app/page/demo/widget/tab_style.dart';
import 'package:flutter_app/page/demo/widget/text_rich.dart';



// demo
Map<String,WidgetBuilder> demoRoutes = {
  // 方法
  'eventTest': (content,{arguments}) => new EventTest(),
  'proportionPaint': (content,{arguments}) => new ProportionPaint(),
  // 插件测试
  'textRichTest': (content,{arguments}) => new TextRichTest(),
  'photoView': (content,{arguments}) => new PhotoView(),// 图片预览
  'networkMonitor': (content,{arguments}) => new NetworkMonitor(),// 网络监听
  'smartDialog': (content,{arguments}) => new SmartDialogWidget(),// smart dialog
  'recorderAudioPlay': (content,{arguments}) => new RecorderAudioPlay(),// 音频录制
  'recordMp3AudioPlay': (content,{arguments}) => new RecordMp3AudioPlay(),// 音频录制
  // 组件测试
  'tabStyleTest': (content,{arguments}) => new TabStyleTest(),
  'scrollStack': (context,{arguments}) => new ScrollStack(),
  'customScrollViewTest': (context,{arguments}) => new CustomScrollViewTest(),// 滚动
  'scrollControllerTest': (context,{arguments}) => new ScrollControllerTest(),// 滚动
  'scrollPositionRecord': (context,{arguments}) => new ScrollPositionRecord(),// 滚动
  'scrollAddListener': (context,{arguments}) => new ScrollAddListener(),// 滚动
  // 动画测试
  'animationTest1': (context,{arguments}) => new AnimationTest1(),
  'animationTest2': (context,{arguments}) => new AnimationTest2(),
  // 没有网络
  'noneWeb': (context,{arguments}) => new NoneWeb(),
};