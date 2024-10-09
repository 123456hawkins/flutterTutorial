import 'package:flutter/cupertino.dart';

import 'ChangeNotifierProvider.dart';

// 消费者封装类，会获得当前context和指定数据类型的provider
class Consumer<T> extends StatelessWidget {
  Consumer({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, T? value) builder;
  @override
  Widget build(BuildContext context) {
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
