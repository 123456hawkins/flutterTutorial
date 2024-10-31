import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class gestureRecognizerTestRoute extends StatefulWidget {
  const gestureRecognizerTestRoute({super.key});
  @override
  _gestureRecognize createState() => _gestureRecognize();
}

class _gestureRecognize extends State<gestureRecognizerTestRoute> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;
  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(text: '你好世界'),
          TextSpan(
              text: '点我变色',
              style: TextStyle(
                  fontSize: 30, color: _toggle ? Colors.blue : Colors.green),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          TextSpan(text: '你好世界')
        ]),
      ),
    );
  }
}
