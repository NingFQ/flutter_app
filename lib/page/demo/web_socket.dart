import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketTest extends StatefulWidget {
  const WebSocketTest({Key key}) : super(key: key);

  @override
  _WebSocketTestState createState() => _WebSocketTestState();
}

class _WebSocketTestState extends State<WebSocketTest> {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel.sink.add('Hello!');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Socket'),
      ),
      body: new StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          return new Text(snapshot.hasData ? '${snapshot.data}' : 'aaa');
        },
      ),
    );
  }
}
