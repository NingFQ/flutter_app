import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ScrollStack extends StatefulWidget {
  @override
  _ScrollStackState createState() => _ScrollStackState();
}

class _ScrollStackState extends State<ScrollStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll && Stack'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.amber,
        child: Stack(
          children: <Widget>[
            EasyRefresh(
              onRefresh: () async {

              },
              onLoad: () async {

              },
              child: Column(
                children: ['','','','','','','','','','','',''].map((item) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 100,
                    color: Colors.amber,
                  );
                }).toList()
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            )
          ],
        )
      )
    );
  }
}
