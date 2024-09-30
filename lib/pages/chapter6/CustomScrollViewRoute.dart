import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/SliverHeaderDelegate.dart';

class CustomScrollViewRoute extends StatelessWidget {
  const CustomScrollViewRoute({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

        // PersistentHeaderRoute();

        NewScroller();

    //   Scaffold(
    //   appBar: AppBar(
    //     title: const Text('CustomScrollView'),
    //   ),
    //   body: buildTwoSliverList(),
    // );
  }
}

// 滚动条各占一半，分别有自己的滚动事件
class TwoWidgetList extends StatefulWidget {
  @override
  _TwoWidgetListState createState() => _TwoWidgetListState();
}

class _TwoWidgetListState extends State<TwoWidgetList> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) => ListTile(title: Text("$index")));
    return Column(
      children: [
        Expanded(child: listView),
        Divider(color: Colors.black54),
        Expanded(child: listView)
      ],
    );
  }
}

//两个listView共用一个滚动条
Widget buildTwoSliverList() {
  // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
  // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
  // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
  var listView = SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => ListTile(
                title: Text("$index"),
              ),
          childCount: 20),
      itemExtent: 56);
  return CustomScrollView(
    slivers: [listView, listView],
  );
}

Widget NewScroller() {
  return Material(
    child: CustomScrollView(
      slivers: <Widget>[
        // AppBar，包含一个导航栏.
        SliverAppBar(
          pinned: true, // 滑动到顶端时会固定住
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background:
                  const Image(image: AssetImage('assets/images/sea.jpg'))),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            //Grid
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              //创建列表项
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ),
  );
}

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

class PersistentHeaderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverList(),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegate(
            //有最大和最小高度
            maxHeight: 80,
            minHeight: 50,
            child: buildHeader(1),
          ),
        ),
        buildSliverList(),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegate.fixedHeight(
            //固定高度
            height: 50,
            child: buildHeader(2),
          ),
        ),
        buildSliverList(20),
      ],
    );
  }

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

  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}
