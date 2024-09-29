import 'package:flutter/material.dart';

class alignLayout extends StatelessWidget {
  const alignLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('对齐与相对定位（Align）')),
      body: Column(children: [
        Container(
          height: 120,
          width: 120,
          color: Colors.blue.shade50,
          child: const Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
        Container(
            color: Colors.green.shade50,
            child: const Align(
              heightFactor: 2,
              widthFactor: 2,
              alignment: Alignment.center,
              child: FlutterLogo(
                size: 60,
              ),
            )),
        Container(
            color: Colors.yellow.shade50,
            child: const Align(
              heightFactor: 2,
              widthFactor: 2,
              alignment: Alignment(2, 0), //(0,0)代表中心原点,(1,0)为最右边
              child: FlutterLogo(
                size: 60,
              ),
            )),
        Container(
            color: Colors.red.shade50,
            child: const Align(
              heightFactor: 2,
              widthFactor: 2,
              alignment: FractionalOffset(0, 0), //(0,0)代表左侧顶点
              child: FlutterLogo(
                size: 60,
              ),
            )),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Text('xxx'),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text('xx123123x'),
          ),
        )
      ]),
    );
  }
}
