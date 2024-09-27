import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollerMonitor extends StatefulWidget {
  @override
  _ScrollerMonitor createState() => _ScrollerMonitor();
}

class _ScrollerMonitor extends State<ScrollerMonitor> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  String _progress = "0%";
  @override
  void initState() {
    super.initState();
    // 延迟执行以确保 widget 已经构建完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final double? savedPosition = PageStorage.of(context)?.readState(context);
      if (savedPosition != null) {
        _controller.jumpTo(savedPosition);
      }
    });
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
      PageStorage.of(context).writeState(context, _controller.offset);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动控制'),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                double progress = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                setState(() {
                  _progress = '${(progress * 100).toInt()}%';
                });
                print('BottomEdge:${notification.metrics.extentAfter == 0}');
                return false;
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                      controller: _controller,
                      itemCount: 100,
                      itemExtent: 50, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('$index'),
                        );
                      }),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child: Text(_progress),
                  )
                ],
              ))),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              }),
    );
  }
}
