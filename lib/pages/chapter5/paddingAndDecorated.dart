import 'package:flutter/material.dart';
import 'dart:math' as math;

class paddingAndDecorated extends StatelessWidget {
  const paddingAndDecorated({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('填充和装饰容器'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("hello")),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("hello2"),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 40, 20),
                child: Text('hello3'),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.blue.shade700]),
                    borderRadius: BorderRadius.circular(3.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ]),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                  child: Text('点我'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.black,
                child: Transform(
                  transform: Matrix4.skewY(0.3),
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.deepOrange,
                      child: const Text('Stephen Hawkins')),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: const Offset(-20, -5),
                  child: const Text("hello"),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: const Text(' world'),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 2,
                    child: const Text("fuck"),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.red),
                    child:
                        Transform.scale(scale: 1.5, child: const Text('hello world')),
                  ),
                  const Text(
                    '你好',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    // 对比transform.rotate,RotateBox的变换阶段是在layout，会影响子组件
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text('旋转盒子'),
                    ),
                  ),
                  Text(
                    '你好',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 50.0),
                constraints: const BoxConstraints.tightFor(width: 200, height: 150),
                transform: Matrix4.rotationZ(.5),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.green, Colors.orange],
                        center: Alignment.topLeft,
                        radius: .98),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          offset: Offset(10, 10),
                          blurRadius: 4)
                    ]),
                child: const Text(
                  'nihao',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 120),
              const ClipTestRoute()
            ],
          ),
        ));
  }
}

class ClipTestRoute extends StatelessWidget {
  const ClipTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget avatar = Image.asset('assets/images/lahe.jpg', width: 60);
    return Center(
      child: Column(
        children: [
          avatar, //不裁剪
          ClipOval(
            child: avatar, //裁剪圆形
          ),
          ClipRect(clipBehavior: Clip.antiAlias, child: avatar),
          Row(
            // 会溢出
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5,
                child: avatar,
              ),
              const Text('你好世界')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              const Text('你好世界123')
            ],
          ),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: ClipRect(
              clipper: MyClipper(),
              child: avatar,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              children: [Text('xxx' * 30)],
            ),
          ),
          wContainer(BoxFit.none),
          const Text('wendux'),
          wContainer(BoxFit.contain),
          const Text("flutterchina"),
          Column(
              children: [
            wRow(' 9000000000000000 '),
            FittedBox(child: wRow(' 90000000000000000 ')),
            wRow(' 800 '),
            FittedBox(child: wRow(' 800 ')),
          ]
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: e,
                      ))
                  .toList()),

          const SizedBox(
            height: 50,
          ),
          SingleLineFittedBox(child: wRow(' 900000000000000123112312300 '))
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10, 15, 40, 30);
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

Widget wContainer(BoxFit boxFit) {
  return ClipRect(
      //将超出父元素部分裁切掉
      child: Container(
    height: 50,
    width: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      child: Container(
        width: 60,
        height: 70,
        color: Colors.blue,
      ),
    ),
  ));
}

Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return FittedBox(
        child: ConstrainedBox(
          constraints: constraints.copyWith(
              minWidth: constraints.maxWidth, maxWidth: double.infinity),
          child: child,
        ),
      );
    });
  }
}
