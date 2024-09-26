import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class c5main extends StatelessWidget {
  const c5main({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第五章容器类组件'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_five/paddingAndDecorated');
                },
                child: const Text('填充和装饰容器')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_five/myScaffold');
                },
                child: const Text('页面骨架')),
          ],
        ),
      ),
    );
  }
}
