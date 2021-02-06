import 'package:event_bus/event_bus.dart';
//Bus 初始化
EventBus eventBus = EventBus();
class ProductContentEvent {
  String text;
  ProductContentEvent(String text){
    this.text = text;
  }
}