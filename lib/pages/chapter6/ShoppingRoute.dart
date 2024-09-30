import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingRoute extends StatelessWidget {
  const ShoppingRoute({super.key});
  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      title: const Text('商城'),
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                          tabs: _tabs
                              .map((String name) => Tab(text: name))
                              .toList()),
                    ),
                  )
                ];
              },
              body: TabBarView(
                  children: _tabs.map((String name) {
                return Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverPadding(
                        padding: const EdgeInsets.all(8),
                        sliver: buildSliverList(50),
                      )
                    ],
                  );
                });
              }).toList())),
        ));
  }
}
