import 'package:flutter/material.dart';

import 'CartModel.dart';
import 'ChangeNotifierProvider.dart';
import 'Consumer.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('跨组件状态管理(Provider)')),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
            data: CartModel(),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  Builder(builder: (context) {
                    // var cart = ChangeNotifierProvider.of<CartModel>(context);
                    // return Text(
                    //     '总价：${cart.totalPrice},商品数量：${cart.items.length}');
                    // 使用封装的消费者类
                    return Consumer<CartModel>(
                        builder: (context, cart) => Text(
                            '总价:${cart!.totalPrice},商品数量：${cart.items.length}'));
                  }),
                  Builder(builder: (context) {
                    var cart = ChangeNotifierProvider.of<CartModel>(context);

                    return Text(
                        '总价：${cart.totalPrice},商品数量：${cart.items.length}');
                  }),
                  Builder(builder: (context) {
                    print('ElevatedButton build');
                    return ElevatedButton(
                        onPressed: () {
                          ChangeNotifierProvider.of<CartModel>(context,
                                  listen: false)
                              .add(Item(20, 1));
                        },
                        child: const Text('添加商品'));
                  })
                ],
              );
            })),
      ),
    );
  }
}
