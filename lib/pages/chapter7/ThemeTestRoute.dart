import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  var _themeColor = Colors.teal;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            primarySwatch: _themeColor,
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          backgroundColor:
              _themeColor == Colors.teal ? Colors.green : Colors.yellow,
          appBar: AppBar(
            title: const Text('主题测试'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //第一行Icon使用主题中的iconTheme
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('颜色跟随主题')
                ],
              ),
              //为第二行Icon自定义颜色（固定为黑色)
              Theme(
                  data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.black),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text('颜色固定黑色')
                    ],
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() => _themeColor =
                _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette,
                color: _themeColor == Colors.teal
                    ? Colors.grey.shade700
                    : Colors.blue.shade700),
          ),
        ));
  }
}
