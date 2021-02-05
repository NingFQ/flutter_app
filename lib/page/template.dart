import 'package:flutter/material.dart';

class T1 extends StatefulWidget {
  @override
  _T1State createState() => _T1State();
}

class _T1State extends State<T1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
      ),
    );
  }
}


class T2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
