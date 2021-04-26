
// DEMO PAGES
import 'package:flutter/material.dart';
import 'package:flutter_app/page/demo/animation/animation_test.dart';
import 'package:flutter_app/page/demo/animation/components/animation_test1.dart';
import 'package:flutter_app/page/demo/animation/components/animation_test2.dart';
import 'package:flutter_app/page/demo/function/components/proportion_paint.dart';
import 'package:flutter_app/page/demo/function/untils.dart';
import 'package:flutter_app/page/demo/packages/components/network_monitor.dart';
import 'package:flutter_app/page/demo/function/components/event_test/event_test.dart';
import 'package:flutter_app/page/demo/packages/components/record_mp3/record_mp3.dart';
import 'package:flutter_app/page/demo/packages/components/record_mp3/recorder_mp3.dart';
import 'package:flutter_app/page/demo/packages/components/smart_dialog.dart';
import 'package:flutter_app/page/demo/packages/packages_test.dart';
import 'package:flutter_app/page/demo/packages/components/photo_view.dart';
import 'package:flutter_app/page/demo/packages/components/english_word.dart';
import 'package:flutter_app/page/demo/widget/components/custom_scroll_view.dart';
import 'package:flutter_app/page/demo/widget/components/scroll_controller.dart';

import 'package:flutter_app/page/demo/widget/components/none_web.dart';
import 'package:flutter_app/page/demo/widget/components/scroll_stack.dart';
import 'package:flutter_app/page/demo/widget/components/tab_style.dart';
import 'package:flutter_app/page/demo/widget/components/text_rich.dart';
import 'package:flutter_app/page/demo/widget/widget_test_index.dart';



// demo
Map<String,WidgetBuilder> demoRoutes = {
  // 方法
  'untilPage': (content,{arguments}) => new UntilsPage(),
  'eventTest': (content,{arguments}) => new EventTest(),
  'proportionPaint': (content,{arguments}) => new ProportionPaint(),
  // 插件测试
  'packagesTest': (content,{arguments}) => new PackagesTest(),
  'textRichTest': (content,{arguments}) => new TextRichTest(),
  'englishWord': (content,{arguments}) => new EnglishWord(),
  'photoView': (content,{arguments}) => new PhotoView(),// 图片预览
  'networkMonitor': (content,{arguments}) => new NetworkMonitor(),// 网络监听
  'smartDialog': (content,{arguments}) => new SmartDialogWidget(),// smart dialog
  'recorderAudioPlay': (content,{arguments}) => new RecorderAudioPlay(),// 音频录制
  'recordMp3AudioPlay': (content,{arguments}) => new RecordMp3AudioPlay(),// 音频录制
  // 组件测试
  'widgetTestIndex': (content,{arguments}) => new WidgetTestIndex(),
  'tabStyleTest': (content,{arguments}) => new TabStyleTest(),
  'scrollStack': (context,{arguments}) => new ScrollStack(),
  'customScrollViewTest': (context,{arguments}) => new CustomScrollViewTest(),// 滚动
  'scrollControllerTest': (context,{arguments}) => new ScrollControllerTest(),// 滚动
  // 动画测试
  'animationTest': (context,{arguments}) => new AnimationTest(),
  'animationTest1': (context,{arguments}) => new AnimationTest1(),
  'animationTest2': (context,{arguments}) => new AnimationTest2(),
  // 没有网络
  'noneWeb': (context,{arguments}) => new NoneWeb(),
};