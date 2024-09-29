import 'package:flutter/material.dart';

class layoutB extends StatelessWidget {
  const layoutB({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder,AfterLayout'),
      ),
      body: const Column(
        children: [LayoutBuilderRoute()],
      ),
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});
  @override
  Widget build(BuildContext context) {
    var children = List.filled(8, const Text('A'));
    return Column(
      children: [
        SizedBox(width: 400, child: ResponsiveColumn(children: children)),
        ResponsiveColumn(children: children),
        const LayoutLogPrint(child: Text("xx")),
        const AfterLayoutRoute()
      ],
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          // 大于200，显示双列
          var children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              children.add(Row(
                mainAxisSize: MainAxisSize.min,
                children: [children[i], children[i + 1]],
              ));
            } else {
              children.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({super.key, this.tag, required this.child});
  final Widget child;
  final T? tag; //指定日志tag
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      assert(() {
        print('${tag ?? key ?? child}:$constraints');
        return true;
      }());
      return child;
    });
  }
}

class AfterLayoutRoute extends StatefulWidget {
  const AfterLayoutRoute({super.key});
  @override
  _AfterLayoutRouteState createState() => _AfterLayoutRouteState();
}

class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
  final String _text = 'flutter 实战';
  final Size _size = Size.zero;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Builder(builder: (context) {
            return GestureDetector(
                child: const Text('Text1:点我获取大小',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue)),
                onTap: () => print('Text1:${context.size}'));
          }),
        )
      ],
    );
  }
}
