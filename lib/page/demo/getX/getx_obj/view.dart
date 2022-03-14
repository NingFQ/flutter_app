import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class GetXObjPage extends StatelessWidget {
  final logic = Get.put(GetXObjLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX改变Obj')),
      body: Center(
        // child: Obx(
        //   () => Text(
        //     '点击了 ${logic.count.value} 次',
        //     style: TextStyle(fontSize: 30.0),
        //   ),
        // ),
        child: GetBuilder<GetXObjLogic>(
          builder: (logic) => Text(
            '用户名字：${logic.user().name},用户年龄：${logic.user().age}',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          logic.changeInfo();
        },
        child: const Icon(Icons.add),
      ),
    );;
  }
}
