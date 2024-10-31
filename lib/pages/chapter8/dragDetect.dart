import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dragDetect extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<dragDetect> with SingleTickerProviderStateMixin {
  double _top = 100;
  double _left = 100;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: const Text('A'),
              ),
              onPanDown: (DragDownDetails e) {
                print('用户手指按下：${e.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                  // _left += e.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ))
      ],
    );
  }
}
