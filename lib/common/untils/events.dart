import 'package:event_bus/event_bus.dart';
//Bus 初始化
EventBus eventBus = EventBus();
// 广播事件测试
class ProductContentEvent {
  String text;
  ProductContentEvent(String text){
    this.text = text;
  }
}
// 首页回到顶部并刷新
class RefreshIndex {

}