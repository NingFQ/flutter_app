import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> with SingleTickerProviderStateMixin{


  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 2),vsync: this);
    animation = new Tween(begin: 0.0, end: 100.0).animate(controller)
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
            Center(
              child: new Container(
                height: animation.value,
                width: animation.value,
                child: new FlutterLogo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
