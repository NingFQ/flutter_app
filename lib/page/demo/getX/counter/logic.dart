import 'package:get/get.dart';

class CounterLogic extends GetxController {
  var count = 0;

  void increase() {
    count ++;
    /// 不是obs类型的变量 需要调用updata方法来进行刷新
    update();
  }
}
