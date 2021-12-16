import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterProPage extends StatelessWidget {
  final logic = Get.put(CounterProLogic());
  final state = Get.find<CounterProLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
