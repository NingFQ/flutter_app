import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationTest1 extends StatefulWidget {
  @override
  _AnimationTest1State createState() => _AnimationTest1State();
}

class _AnimationTest1State extends State<AnimationTest1>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Animation<Color> animation2;
  AnimationController controller2;

  Animation<int> animation3;
  AnimationController controller3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller2 = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    controller3 = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = new Tween(begin: 0.0, end: 200.0).animate(controller)
      ..addListener(() {
        // print(controller.value);
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
    animation2 = new ColorTween(begin: Colors.red, end: Colors.amber)
        .animate(controller2)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    controller2.forward();

    animation3 = new IntTween(begin: 0, end: 200).animate(controller3)
      ..addListener(() {
        setState(() {});
      });
    controller3.forward();
  }

  dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween'),
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
            Container(
              width: 200,
              height: 200,
              color: animation2.value,
            ),
            Text(
              '${animation3.value}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
