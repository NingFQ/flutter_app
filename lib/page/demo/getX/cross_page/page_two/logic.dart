import 'package:get/get.dart';

class PageTwoLogic extends GetxController {
  var count = 0;
  var msg = '';

  @override
  void onReady() {
    var map = Get.arguments;
    print(map);
    msg = map['msg'];
    update();
    super.onReady();
  }

  void increase() {
    count = ++count;
    update();
  }
}