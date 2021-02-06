import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class NetworkMonitor extends StatefulWidget {
  @override
  _NetworkMonitorState createState() => _NetworkMonitorState();
}

class _NetworkMonitorState extends State<NetworkMonitor> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) async {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
        case ConnectivityResult.none:
          setState(() => _connectionStatus = result.toString());
          break;
        default:
          setState(() => _connectionStatus = 'Failed to get connectivity.');
          break;
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity example app'),
      ),
      body: Center(child: Text('Connection Status: $_connectionStatus')),
    );
  }
}
