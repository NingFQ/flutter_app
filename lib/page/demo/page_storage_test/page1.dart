import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {

  Page1({Key key}):super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class Page1Params {
  int counter = 0;
}

class _Page1State extends State<Page1> {
  Page1Params params = new Page1Params();

  @override
  void initState() {
    Page1Params p = PageStorage.of(context).readState(context);
    if (p != null) {
      params = p;
    } else {
      params = Page1Params();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove, size: 32.0),
                onPressed: () {
                  setState(() {
                    params.counter --;
                  });
                  PageStorage.of(context).writeState(context, params);
                },
              ),
              Text(
                '${params.counter}',
                style: TextStyle(fontSize: 30),
              ),
              IconButton(
                icon: Icon(Icons.add, size: 32.0),
                onPressed: () {
                  setState(() {
                    params.counter ++;
                  });
                  PageStorage.of(context).writeState(context, params);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
