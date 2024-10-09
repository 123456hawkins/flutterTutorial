import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String title;
  final Color color;
  const NavBar({
    Key? key,
    required this.color,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints:
          const BoxConstraints(minHeight: 52, minWidth: double.infinity),
      decoration: BoxDecoration(color: color, boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 3), blurRadius: 3)
      ]),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                color.computeLuminance() < 0.5 ? Colors.white : Colors.black),
      ),
    );
  }
}

class ColorTestRoute extends StatelessWidget {
  const ColorTestRoute({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('色彩和主题'),
      ),
      body: const Column(
        children: [
          NavBar(
            color: Colors.blue,
            title: '标题',
          ),
          NavBar(color: Colors.white, title: '标题')
        ],
      ),
    );
  }
}
