import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin;
  TestFlowDelegate({this.margin = EdgeInsets.zero});
  double width = 0;
  double height = 0;
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 400);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class flowAndWrap extends StatelessWidget {
  const flowAndWrap({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('流式布局'),
      ),
      body: Column(
        children: [
          Center(
            child: Wrap(
              spacing: 8, //主轴间距
              runSpacing: 5, //副轴间距
              alignment: WrapAlignment.center,
              children: <Widget>[
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
                Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                    label: Text('hawkins')),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Flow(
              delegate: TestFlowDelegate(margin: EdgeInsets.all(10)),
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
