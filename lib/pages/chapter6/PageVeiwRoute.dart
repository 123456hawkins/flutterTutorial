import 'package:flutter/material.dart';
import 'package:flutter_project/components/KeepAliveWrapper.dart';

class PageViewRoute extends StatelessWidget {
  const PageViewRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('pageView与页面缓存'),
        ),
        body: const PageViewComponent());
  }
}

class PageViewComponent extends StatefulWidget {
  const PageViewComponent({super.key});

  @override
  _PageViewComponent createState() => _PageViewComponent();
}

class _PageViewComponent extends State<PageViewComponent> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; ++i) {
      // 使用KeepAliveWrapper包装组件实现缓存
      children.add(KeepAliveWrapper(keepAlive: true, child: Page(text: '$i')));
    }
    return PageView(
      // allowImplicitScrolling: true, //允许预渲染
      // scrollDirection: Axis.vertical,//滑动方向为垂直方向
      children: children,
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key, required this.text});
  final String text;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }

  @override
  void dispose() {
    print('dispose ${widget.text}');
    super.dispose();
  }
}
