import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PageOnePage extends StatelessWidget {
  final logic = Get.put(PageOneLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('跨页面-One')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.toJumpTwo(),
        child: const Icon(Icons.arrow_forward_outlined),
      ),
      body: Center(
        child: GetBuilder<PageOneLogic>(
          builder: (logic) {
            return Text(
              '跨页面-Two点击了 ${logic.count} 次',
              style: TextStyle(fontSize: 30.0),
            );
          },
        ),
      ),
    );
  }
}
