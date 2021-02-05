import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class EnglishWord extends StatelessWidget {


  void main() {
    generateWordPairs().forEach(print);
  }

  _buildWordList(int len) {
    List<Widget> wordList = [
      Container(
        margin: EdgeInsets.only(top: 10,),
        child: Center(
          child: Text('随机生成$len个单词',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      )
    ];
    for (int i = 0;i < len;i ++) {
      wordList.add(Container(
        margin: EdgeInsets.only(top: 20,),
        child: Center(
          child: Text(
            '${WordPair.random()}',
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
      ));
    }
    return wordList;
  }

  @override
  Widget build(BuildContext context) {
    // main();
    return Scaffold(
      appBar: AppBar(
        title: Text('English Word'),
      ),
      body: Container(
        child: Center(
          child: MediaQuery.removePadding(context: context, child: ListView(
            children: _buildWordList(10),
          ),)
        )
      ),
    );
  }
}
