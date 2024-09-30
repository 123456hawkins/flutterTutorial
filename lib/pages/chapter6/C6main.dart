import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class C6main extends StatelessWidget {
  const C6main({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: const Text('可滚动组件')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/SingleChildScrollViewTestRoute');
                  },
                  child: const Text('SingleChildScrollView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/ListView');
                  },
                  child: const Text('ListView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/ScrollerMonitor');
                  },
                  child: const Text('ScrollerController')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/AnimatedList');
                  },
                  child: const Text('AnimatedList')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/GridViewRoute');
                  },
                  child: const Text('GridView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/PageView');
                  },
                  child: const Text('PageView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/TabBarView');
                  },
                  child: const Text('TabBarView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/CustomScrollView');
                  },
                  child: const Text('CustomScrollView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/CustomSliverView');
                  },
                  child: const Text('CustomSliverView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/NestedScrollView');
                  },
                  child: const Text('NestedScrollView')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/SnapAppBar');
                  },
                  child: const Text('SnapAppBar')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six/ShoppingRoute');
                  },
                  child: const Text('ShoppingRoute')),
            ],
          ),
        ));
  }
}
