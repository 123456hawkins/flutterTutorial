import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureDetectRoute extends StatefulWidget {
  const GestureDetectRoute({super.key});
  @override
  _GestureDetectRouteState createState() => _GestureDetectRouteState();
}

class _GestureDetectRouteState extends State<GestureDetectRoute> {
  String _operation = 'No getsture detected';
  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('手势识别'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 200,
                  height: 150,
                  child: Text(
                    _operation,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () => updateText("Tap"),
                onDoubleTap: () => updateText('DoubleTap'),
                onLongPress: () => updateText('longPress'))
          ],
        ),
      ),
    );
  }
}
