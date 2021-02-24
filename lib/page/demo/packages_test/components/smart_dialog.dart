// import 'package:flutter/material.dart';
// import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
//
// class SmartDialogWidget extends StatefulWidget {
//   @override
//   _SmartDialogWidgetState createState() => _SmartDialogWidgetState();
// }
//
// class _SmartDialogWidgetState extends State<SmartDialogWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SmartDialog'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             RaisedButton(
//               child: Text('弹出Toast'),
//               onPressed: () {
//                 SmartDialog.showToast(
//                   '',
//                   alignment: Alignment.topCenter,
//                   widget: Container(
//                     width: 200,
//                     height: 40,
//                     color: Colors.amber,
//                     child: Text('网络有无'),
//                   )
//                 );
//               },
//             ),
//             RaisedButton(
//               child: Text('弹出Loading'),
//               onPressed: () async{
//                 SmartDialog.showLoading();
//                 await Future.delayed(Duration(seconds: 2));
//                 SmartDialog.dismiss();
//               },
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }
