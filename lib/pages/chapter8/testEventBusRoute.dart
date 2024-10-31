import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class testEventBusRoute extends StatefulWidget {
  const testEventBusRoute({super.key});
  @override
  _testEventBusRouteState createState() => _testEventBusRouteState();
}

class _testEventBusRouteState extends State<testEventBusRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("测试事件总线"),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
