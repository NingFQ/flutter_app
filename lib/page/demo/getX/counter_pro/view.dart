import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterProPage extends StatelessWidget {
  final logic = Get.put(CounterProLogic());
  final state = Get.find<CounterProLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器-进阶版')),
      body: Center(
        child: GetBuilder<CounterProLogic>(
          builder: (logic) {
            return Text(
              '点击了 ${state.count} 次',
              style: TextStyle(fontSize: 30.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: Icon(Icons.add),
      ),
    );
  }
}
