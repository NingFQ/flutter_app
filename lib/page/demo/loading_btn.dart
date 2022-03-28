import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoadingBtn extends StatefulWidget {
  const LoadingBtn({Key key}) : super(key: key);

  @override
  _LoadingBtnState createState() => _LoadingBtnState();
}

class _LoadingBtnState extends State<LoadingBtn> {
  final RoundedLoadingButtonController _btnController1 =
  RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
  RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 3), () {
      controller.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rounded Loading Button Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedLoadingButton(
                child: Text('Tap me!', style: TextStyle(color: Colors.white)),
                controller: _btnController1,
                onPressed: () => _doSomething(_btnController1),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedLoadingButton(
                color: Colors.amber,
                successColor: Colors.amber,
                controller: _btnController2,
                onPressed: () => _doSomething(_btnController2),
                valueColor: Colors.black,
                borderRadius: 10,
                child: Text('''
Tap me i have a huge text''', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 50,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  onPressed: () {
                    _btnController1.reset();
                    _btnController2.reset();
                  },
                  child: Text('Reset')),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.error();
                  _btnController2.error();
                },
                child: Text('Error'),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                ),
                onPressed: () {
                  _btnController1.success();
                  _btnController2.success();
                },
                child: Text('Success'),
              )
            ],
          ),
        ));
  }
}

// enum LoadingStatus { init, loading, success, failed }
//
// class LoadingButton extends StatefulWidget {
//   final LoadingStatus s;
//   final String t;
//   final Function parentFn;
//   const LoadingButton({Key key, @required this.s, this.t, this.parentFn})
//       : super(key: key);
//
//   @override
//   _LoadingButtonState createState() => _LoadingButtonState();
// }
//
// class _LoadingButtonState extends State<LoadingButton> {
//
//   @override
//   void initState() {
//     print('widget.s===${widget.s}');
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       width: 200,
//       height: 80,
//       child: ElevatedButton(
//         shape: BeveledRectangleBorder(
//           borderRadius: BorderRadius.circular(4),
//         ),
//         onPressed: widget.s == LoadingStatus.failed ? null : () => {},
//         color: Colors.blue,
//         child: Text(
//           widget.t??'ss',
//           // '${widget.s == LoadingStatus.init ? '默认' : widget.s == LoadingStatus.loading ? '加载中...' : '完成'}',
//           style: TextStyle(
//             fontSize: 30,
//           ),
//         ),
//       ),
//     );
//   }
// }
