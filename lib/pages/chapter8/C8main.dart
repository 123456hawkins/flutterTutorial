import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:go_router/go_router.dart';

class C8main extends StatelessWidget {
  const C8main({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('第八章.事件处理与通知'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/rawPointerEvent');
                },
                child: const Text('原始指针事件')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/gestureDetect');
                },
                child: const Text('手势识别')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/dragDetect');
                },
                child: const Text('拖拽识别')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/gestureScale');
                },
                child: const Text('放大识别')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/waterMask');
                },
                child: const Text('水印测试')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_eight/notification');
                },
                child: const Text('通知')),
          ],
        ),
      ),
    );
  }
}
