import 'package:flutter/material.dart';

class FutureBuildTest extends StatefulWidget {
  @override
  _FutureBuildTestState createState() => _FutureBuildTestState();
}

class _FutureBuildTestState extends State<FutureBuildTest> {

  Future<String> mockData() async{
    return Future.delayed(Duration(seconds: 2),() => 'return "mock data";');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockData(),
          // initialData: Icon(Icons.refresh),
          builder: (BuildContext context,AsyncSnapshot snapshot)  {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
