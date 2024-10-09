import 'package:flutter/material.dart';

class PopScopeRoute extends StatefulWidget {
  @override
  PopScopeRouteState createState() => PopScopeRouteState();
}

class PopScopeRouteState extends State<PopScopeRoute> {
  DateTime? _lastPressedAt;
  bool _canPop = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, data) {
        if (didPop) return;
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(milliseconds: 1000)) {
          _lastPressedAt = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('1s内再按两次退出'),
          ));
        } else {
          setState(() {
            _canPop = true;
          });
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('PopScope Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('1s内连续按两次返回键退出'),
        ),
      ),
    );
  }
}
