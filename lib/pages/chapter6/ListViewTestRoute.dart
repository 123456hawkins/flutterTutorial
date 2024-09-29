import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/KeepAliveWrapper.dart';

class ListViewTestRoute extends StatelessWidget {
  const ListViewTestRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView')),
        body:
            // TestListHead()
            KeepAliveTest()
        // InfiniteListView()
        // ListView3()

        // 普通ListView
        // ListView(
        //   shrinkWrap: true,
        //   padding: const EdgeInsets.all(20.0),
        //   children: [
        //     const Text('I\'m dedicating every day to you'),
        //     const Text('Domestic life was never quite my style'),
        //     const Text('When you smile, you knock me out, I fall apart'),
        //     const Text('And I thought I was so smart'),
        //   ],
        // )

        // ListView.builder(
        //     itemCount: 100,
        //     itemExtent: 20, //字体高度
        //     itemBuilder: (BuildContext context, int index) {
        //       return ListTile(title: Text("$index"));
        //     })

        );
  }
}

// 分隔符列表
class ListView3 extends StatelessWidget {
  const ListView3({super.key});

  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
        itemCount: 100);
  }
}

// 懒加载加载列表
class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const LoadingTag = '###Loading###';
  var _words = <String>[LoadingTag];
  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _words.insertAll(_words.length - 1,
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('title'),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (_words[index] == LoadingTag) {
                    if (_words.length - 1 < 100) {
                      // 到底部获取数据
                      _retrieveData();
                      // 加载时显示Loading
                      return Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    } else {
                      //   已经加载了100条不再加载
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        child:
                            Text('没有更多了', style: TextStyle(color: Colors.grey)),
                      );
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: .0,
                    ),
                itemCount: _words.length))
      ],
    );
  }
}

// 表头demo
class TestListHead extends StatefulWidget {
  @override
  _TestListHead createState() => _TestListHead();
}

class _TestListHead extends State<TestListHead> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text('商品列表')),
        Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                }))
      ],
    );
  }
}

class KeepAliveTest extends StatelessWidget {
  const KeepAliveTest({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: (_, index) {
      // 为 true 后会缓存所有的列表项，列表项将不会销毁。
      // 为 false 时，列表项滑出预加载区域后将会别销毁。
      // 使用时一定要注意是否必要，因为对所有列表项都缓存的会导致更多的内存消耗
      return KeepAliveWrapper(keepAlive: false, child: ListItem(index: index));
    });
  }
}

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(title: Text('${widget.index}'));
  }

  @override
  void dispose() {
    print('dispose ${widget.index}');
    super.dispose();
  }
}
