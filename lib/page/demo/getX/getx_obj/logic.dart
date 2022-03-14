import 'package:get/get.dart';


class User{
  User({this.name = 'test', this.age = 0});
  String name;
  int age;
}


class GetXObjLogic extends GetxController {
  /// 声明用户信息
  final user = User().obs;

  /// 修改用户信息
  void changeInfo() {
    // user.update( (user) { // 这个参数是你要更新的类本身。
    //   user.name = 'Jonny';
    //   user.age = 18;
    // });
    user(User(name: 'Jonny', age: 35));
    update();
  }

}
