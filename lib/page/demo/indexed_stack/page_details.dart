import 'package:flutter/material.dart';

/// 页面详情
class PageDetails extends StatelessWidget {
  final title;
  const PageDetails({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 这里的打印可以记录一下，后面会用到
    print('PageDetails build title:$title');
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
