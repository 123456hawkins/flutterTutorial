import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);
  final int data;
//   定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return context
        .getElementForInheritedWidgetOfExactType<ShareDataWidget>()!
        .widget as ShareDataWidget;
  }

// 该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  InheritedWidgetTestRouteState createState() =>
      InheritedWidgetTestRouteState();
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget'),
      ),
      body: Center(
          child: ShareDataWidget(
              data: count,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: _TestWidget(),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Text('子组件2'),
                              _TestWidget(),
                            ],
                          ))),
                  ElevatedButton(
                      onPressed: () => setState(() => count++),
                      child: Text('Increment')),
                  ElevatedButton(
                      onPressed: () => setState(() => count--),
                      child: Text('Decrement'))
                ],
              ))),
    );
  }
}
