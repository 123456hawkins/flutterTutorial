import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class image_page extends StatelessWidget {
  const image_page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片组件'),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // 本地引入
            Image(image: AssetImage('assets/images/google.png')),
            // 在线引入
            Image.network(
              'https://pics2.baidu.com/feed/7acb0a46f21fbe09945a9ace2b0b963d8644ad5a.jpeg@f_auto?token=594a9aabed930d8f979a4e404a879201',
            ),
            const Image(
              image: AssetImage('assets/images/google.png'),
              width: 100,
              height: 200,
              fit: BoxFit.fill,
            ),
            const Image(
              image: AssetImage('assets/images/google.png'),
              width: 100,
              height: 200,
              fit: BoxFit.contain,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            const Row(
              children: [
                Text(
                  "\uE03e",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 50,
                      color: Colors.green),
                ),
                Text(
                  "\uE237",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 50,
                      color: Colors.green),
                ),
                Text(
                  "\uE287",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 50,
                      color: Colors.green),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
