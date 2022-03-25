import 'package:flutter/material.dart';

class ListApi extends StatefulWidget {
  const ListApi({Key key}) : super(key: key);

  @override
  _ListApiState createState() => _ListApiState();
}

class _ListApiState extends State<ListApi> {
  List<int> numbers = [3, 1, 2, 6, 4, 5];

  @override
  void initState() {
    // TODO: implement initState
    init();

    /// 数组排序方法
    numbers.sort((a, b) => a - b);
    print(numbers);

    /// 数组求和方法 reduce  fold
    int sum = numbers.reduce((curr, next) => curr + next);
    print(sum);

    /// 数组带初始值求和
    const initialValue = 10;
    var sum2 = numbers.fold(initialValue, (curr, next) => curr + next);
    print(sum2);

    /// 数组判断方法 every 确认每个元素都满足测试要求
    List<Map<String, dynamic>> users = [
      {"name": "ZhangSan", "age": 18},
      {"name": "LiSi", "age": 22},
      {"name": "WangWu", "age": 25},
    ];

    /// 是否所有Age都大于等于18
    var is18AndOver = users.every((user) => user["age"] >= 18);
    print(is18AndOver); // => true

    ///  是否所有名字里都含有 大写J
    var hasNamesWithJ = users.every((user) => user["name"].startsWith('J'));
    print(hasNamesWithJ); // => false

    ///  返回Age大于21的集合
    var over21s = users.where((user) => user["age"] > 21);
    print(over21s.length); // => 2

    ///  返回第一个name带Z的集合 first Where（）返回列表中的第一个匹配项
    var nameZ = users.firstWhere(
      (user) => user["name"].startsWith("Z"),
      orElse: () => null,
    );
    print(nameZ); // => {name: ZhangSan, age: 18}

    /// 有没有age小于18的 single Where（）返回第一个匹配项，前提是只有一个匹配项
    var under23s = users.singleWhere(
      (user) => user["age"] > 23,
      orElse: () => null,
    );
    print(under23s); // => {name: WangWu, age: 25}

    ///  在包含或跳过元素时返回集合
    var fiboNumbers = [1, 2, 3, 5, 8, 13, 21];
    print(fiboNumbers.take(3).toList()); // => [1, 2, 3]
    print(fiboNumbers.skip(5).toList()); // => [13, 21]
    print(fiboNumbers.take(3).skip(2).take(1).toList()); // => [3]
    print(fiboNumbers.take(0).toList()); // => []
    print(fiboNumbers.skip(4)); // => (8, 13, 21)
    print(fiboNumbers.take(3).skip(2)); // => (3)

    /// 克隆
    var clonedFiboNumbers = List.from(fiboNumbers);
    print("Cloned list: $clonedFiboNumbers");
    super.initState();

    /// 将每个元素展开为零个或多个元素
    var pairs = [
      [1, 2],
      [3, 4]
    ];
    var flattened = pairs.expand((pair) => pair).toList();
    print("Flattened result: $flattened"); // => [1, 2, 3, 4]
    var input = [1, 2, 3];
    var duplicated = input.expand((i) => [i, i]).toList();
    print(duplicated); // => [1, 1, 2, 2, 3, 3]
  }

  void init() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数组方法'),
      ),
    );
  }
}
