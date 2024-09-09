
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class c3main extends StatelessWidget{
  const c3main({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('第三章：基础组件'),),
      body: Center(child: Column(
        children: [
          const Text('欢迎来到第三章！'),
          ElevatedButton(onPressed: (){context.go('/chapter_three/textPage');}, child: const Text('3.1.Text组件')),
          ElevatedButton(onPressed: (){context.go('/chapter_three/buttonPage');}, child: const Text('3.2.Button组件')),
          ElevatedButton(onPressed: (){context.go('/chapter_three/imagePage');}, child: const Text('3.3.图片组件'))
        ],
      )),
    );
  }
}
