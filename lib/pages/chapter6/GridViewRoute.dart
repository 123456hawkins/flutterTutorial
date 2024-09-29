import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget {
  const GridViewRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('gridView'),
        ),
        body:
            // 横轴固定子元素数量
            // GridView(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 4, childAspectRatio: 1),
            //   children: [
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //     Icon(Icons.home_filled),
            //   ],
            // ),

            // 横轴固定子元素长度
            //     GridView(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 100, childAspectRatio: 1),
            //   children: [
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add),
            //     Icon(Icons.add)
            //   ],
            // )

            //   快速固定数量子元素
            //     GridView.count(
            //   crossAxisCount: 4,
            //   childAspectRatio: 1,
            //   children: [
            //     Icon(Icons.ac_unit),
            //     Icon(Icons.airport_shuttle),
            //     Icon(Icons.all_inclusive),
            //     Icon(Icons.beach_access),
            //     Icon(Icons.cake),
            //     Icon(Icons.free_breakfast),
            //   ],
            // )

            //   快速固定子元素长度
            //     GridView.extent(
            //   maxCrossAxisExtent: 100,
            //   childAspectRatio: 1,
            //   children: [
            //     Icon(Icons.ac_unit),
            //     Icon(Icons.airport_shuttle),
            //     Icon(Icons.all_inclusive),
            //     Icon(Icons.beach_access),
            //     Icon(Icons.cake),
            //     Icon(Icons.free_breakfast),
            //     Icon(Icons.ac_unit),
            //     Icon(Icons.airport_shuttle),
            //     Icon(Icons.all_inclusive),
            //     Icon(Icons.beach_access),
            //     Icon(Icons.cake),
            //     Icon(Icons.free_breakfast)
            //   ],
            // )

            const InfiniteView());
  }
}

//动态构建gridView
class InfiniteView extends StatefulWidget {
  const InfiniteView({super.key});

  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteView> {
  final List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, //每行三列
        childAspectRatio: 1.0, //显示区域宽高相等
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        //如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    print('加载数据');
    Future.delayed(const Duration(milliseconds: 500)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
