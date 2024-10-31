import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaterMaskTest extends StatelessWidget {
  const WaterMaskTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        wChild(1, Colors.white, 200),
        IgnorePointer(child: wChild(2, Colors.white, 200)) //不参与手势识别

        // WaterMark
      ],
    );
  }

  Widget wChild(int index, color, double size) {
    return Listener(
      onPointerDown: (e) => print(index),
      child: Container(
        width: size,
        height: size,
        color: Colors.grey,
      ),
    );
  }
}
