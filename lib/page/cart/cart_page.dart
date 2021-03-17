import 'package:flutter/material.dart';
import 'package:flutter_app/common/provider/cart_count.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
