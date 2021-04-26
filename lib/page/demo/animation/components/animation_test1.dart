import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationTest1 extends StatefulWidget {
  @override
  _AnimationTest1State createState() => _AnimationTest1State();
}

class _AnimationTest1State extends State<AnimationTest1> with SingleTickerProviderStateMixin{


  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 1),vsync: this);
    animation = new Tween(begin: 0.0, end: 1.sw).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: new Container(
                height: animation.value,
                width: animation.value,
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

