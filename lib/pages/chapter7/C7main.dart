import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class C7main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('第七章：功能型组件'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_seven/PopScope');
                },
                child: const Text('PopScope')),
            ElevatedButton(
                onPressed: () {
                  context.go('/chapter_seven/InheritedWidget');
                },
                child: const Text('InheritedWidget')),
          ],
        ),
      ),
    );
  }
}
