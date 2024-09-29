import 'package:flutter/material.dart';

class ScrollerMonitor extends StatefulWidget {
  const ScrollerMonitor({super.key});

  @override
  _ScrollerMonitor createState() => _ScrollerMonitor();
}

class _ScrollerMonitor extends State<ScrollerMonitor>
    with AutomaticKeepAliveClientMixin<ScrollerMonitor> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false;
  String _progress = "0%";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
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
            return false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                key: const PageStorageKey<String>('testScroller'),
                controller: _controller,
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                  );
                },
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black54,
                child: Text(_progress),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: const Duration(milliseconds: 500), curve: Curves.ease);
              }),
    );
  }
}
