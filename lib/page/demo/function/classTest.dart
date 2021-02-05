class ClassTest{
  String name = '张三';
  int age = 20;
  //  默认构造函数
  ClassTest(this.name,this.age);
  //  命名构造函数
  ClassTest.defaultFn() {
    print('命名构造函数');
  }

  get maxAge{
    return 100;
  }

  void _run() {
    print('私有方法');
  }

  void execRun() {
    this._run();
  }

  void printInfo() {
    print('name====$name====age====$age');
  }
}