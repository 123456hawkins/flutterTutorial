import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/KeepAliveWrapper.dart';

// class TabBarViewRoute extends StatefulWidget {
//   @override
//   _TabBarViewRouteState createState() => _TabBarViewRouteState();
// }
//
// class _TabBarViewRouteState extends State<TabBarViewRoute>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List tabs = ['新闻', '历史', '图片'];
//   @override
//   void initState() {
//     _tabController = TabController(length: tabs.length, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//             title: const Text('TabBarView'),
//             bottom: TabBar(
//                 controller: _tabController,
//                 tabs: tabs.map((e) => Tab(text: e)).toList())),
//         body: TabBarView(
//             controller: _tabController,
//             children: tabs.map((e) {
//               return KeepAliveWrapper(
//                   child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   e,
//                   textScaleFactor: 5,
//                 ),
//               ));
//             }).toList()));
//   }
// }

//更简单的写法，无需手动管理Controller生命周期，
class TabBarViewRoute extends StatelessWidget {
  const TabBarViewRoute({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List tabs = ['新闻', '历史', '图片'];
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('simpleTapBar'),
            bottom: TabBar(tabs: tabs.map((e) => Tab(text: e)).toList()),
          ),
          body: TabBarView(
              children: tabs.map((e) {
            return KeepAliveWrapper(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            ));
          }).toList()),
        ));
  }
}
