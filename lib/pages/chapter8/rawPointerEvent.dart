import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rawPointerEvent extends StatefulWidget {
  const rawPointerEvent({super.key});
  @override
  _rawPointerEvent createState() => _rawPointerEvent();
}

class _rawPointerEvent extends State<rawPointerEvent> {
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300,
          height: 150,
          child: Text('${_event?.localPosition ?? ''}',
              style: const TextStyle(color: Colors.white)),
        ),
        onPointerDown: (PointerDownEvent event) => setState(() {
              _event = event;
            }),
        onPointerMove: (PointerMoveEvent event) => setState(() {
              _event = event;
            }),
        onPointerUp: (PointerUpEvent event) => setState(() {
              _event = event;
            }));
  }
}
