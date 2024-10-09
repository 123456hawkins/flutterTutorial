import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueListenableRoute extends StatefulWidget {
  const ValueListenableRoute({Key? key}) : super(key: key);
  @override
  _ValueListenableRoute createState() => _ValueListenableRoute();
}

class _ValueListenableRoute extends State<ValueListenableRoute> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableBuilder 测试'),
      ),
      body: Center(
          child: Column(
        children: [
          ValueListenableBuilder<int>(
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child!,
                  Text('$value次', textScaleFactor: textScaleFactor)
                ],
              );
            },
            valueListenable: _counter,
            // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
            child: const Text('点击了', textScaleFactor: textScaleFactor),
          ),
          ValueListenableBuilder<int>(
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  child!,
                  Text('$value次', textScaleFactor: textScaleFactor),
                  TextButton(
                      onPressed: () => _counter.value--,
                      child: const Text('点我--'))
                ],
              );
            },
            valueListenable: _counter,
            // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
            child: const Text('点击了', textScaleFactor: textScaleFactor),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.value += 1,
        child: const Icon(Icons.add),
      ),
    );
  }
}
