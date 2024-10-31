import 'package:flutter/cupertino.dart';

class gestureTestScale extends StatefulWidget {
  const gestureTestScale({super.key});
  @override
  _gestureTestScale createState() => _gestureTestScale();
}

class _gestureTestScale extends State<gestureTestScale> {
  double _width = 400;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: GestureDetector(
        child: Image.asset(
          'assets/images/lahe.jpg',
          width: _width,
        ),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _width = 200 * details.scale.clamp(.8, 10);
          });
        },
      ),
    );
  }
}
