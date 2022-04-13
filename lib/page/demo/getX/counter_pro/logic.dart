import 'package:get/get.dart';

import 'state.dart';

class CounterProLogic extends GetxController {
  final CounterProState state = CounterProState();

  /// 自增方法
  void increase() {
    state.count = ++state.count;
    update();
  }
}
