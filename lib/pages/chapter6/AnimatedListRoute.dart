import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedListRoute extends StatefulWidget {
  const AnimatedListRoute({super.key});
  @override
  _AnimatedListRouteState createState() => _AnimatedListRouteState();
}

class _AnimatedListRouteState extends State<AnimatedListRoute> {
  var data = <String>[];
  int counter = 5;
  final globalKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    for (var i = 0; i < counter; i++) {
      data.add('${i + 1}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedList'),
        ),
        body: Stack(
          children: [
            AnimatedList(
                key: globalKey,
                initialItemCount: data.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return FadeTransition(
                      opacity: animation, child: buildItem(context, index));
                }),
            buildAddBtn()
          ],
        ));
  }

  // 创建一个+按钮，点击后向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
        bottom: 30,
        left: 0,
        right: 0,
        child: FloatingActionButton(
          onPressed: () {
            data.add('${++counter}');
            globalKey.currentState!.insertItem(data.length - 1);
          },
          child: const Icon(Icons.add),
        ));
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
          onPressed: () => onDelete(context, index),
          icon: const Icon(Icons.delete)),
    );
  }

  void onDelete(context, index) {
    globalKey.currentState!.removeItem(index, (context, animation) {
      // 删除过程执行的是反向动画，animation.value 会从1变为0
      var item = buildItem(context, index);
      data.removeAt(index);
      // 删除动画是一个合成动画：渐隐 + 收缩列表项
      return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            //让透明度变化的更快一些
            curve: const Interval(0.5, 1.0)),
        // 不断缩小列表项的高度
        child: SizeTransition(
            sizeFactor: animation, axisAlignment: 0.0, child: item),
      );
    }, duration: const Duration(milliseconds: 200));
  }
}
