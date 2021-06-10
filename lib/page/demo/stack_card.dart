import 'package:flutter/material.dart';

class StackCard extends StatefulWidget {
  const StackCard({Key key}) : super(key: key);

  @override
  _StackCardState createState() => _StackCardState();
}

class _StackCardState extends State<StackCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.grey.shade50,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
