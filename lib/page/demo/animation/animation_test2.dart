import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationTest2 extends StatefulWidget {
  const AnimationTest2({Key key}) : super(key: key);

  @override
  State<AnimationTest2> createState() => _AnimationTest2State();
}

class _AnimationTest2State extends State<AnimationTest2>
    with TickerProviderStateMixin {
  // 动画1
  AnimationController _controller1;
  Animation _animation1;
  Animation _animation2;
  @override
  void initState() {
    // 动画1
    _controller1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          });
    _animation1 = Tween(begin: 200.0, end: 0.0)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(
          CurvedAnimation(
            parent: _controller1,
            curve: Interval(0.0, 0.1),
          ),
        );
    _animation2 = ColorTween(begin: Colors.blueGrey, end: Colors.black)
        .chain(
          CurveTween(curve: Curves.decelerate),
        )
        .animate(
          CurvedAnimation(
            parent: _controller1,
            curve: Interval(0.5, 1.0),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curve'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _controller1.forward();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    'click',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: _animation1.value),
                color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: _animation2.value,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        '$index',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
