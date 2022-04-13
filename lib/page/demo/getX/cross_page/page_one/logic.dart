import 'package:get/get.dart';

class PageOneLogic extends GetxController {
  var count = 0;

  void toJumpTwo() {
    Get.toNamed('pageTwoPage', arguments: {'msg': '我是上个页面传递过来的数据'});
  }

  void increase() {
    print('页面一的次数count====$count');
    count = ++count;
    update();
  }
}
