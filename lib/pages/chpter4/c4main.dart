import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class c4main extends StatelessWidget {
  const c4main({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第四章布局类组件'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_four/constraints');
                },
                child: const Text('布局原理和约束')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_four/linearLayout');
                },
                child: const Text('线性布局')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_four/flowAndWrap');
                },
                child: const Text('流式布局'))
          ],
        ),
      ),
    );
  }
}
