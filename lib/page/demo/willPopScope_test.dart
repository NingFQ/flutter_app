import 'package:flutter/material.dart';

class WillPopScopeTest extends StatelessWidget {
  const WillPopScopeTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('==========返回');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WillPopScope'),
        ),
        body: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
