import 'package:flutter/material.dart';

class button_page extends StatelessWidget{
  const button_page({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('按钮组件'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){showDialogue(context);}, child:const Text('ElevatedButton') ),
            TextButton(onPressed: (){showDialogue(context);}, child: const Text("TextButton")),
            OutlinedButton(onPressed: (){showDialogue(context);},child: const Text('OutlinedButton'),),
            IconButton(onPressed: (){showDialogue(context);}, icon:const Icon(Icons.add_a_photo) ),
    ElevatedButton.icon(icon: const Icon(Icons.adb),onPressed: (){showDialogue(context);}, label:const Text('ElevatedButton'), ),
    TextButton.icon(icon: const Icon(Icons.account_circle_sharp),onPressed: (){showDialogue(context);}, label: const Text("TextButton")),
    OutlinedButton.icon(icon: const Icon(Icons.account_circle_sharp),onPressed: (){showDialogue(context);},label: const Text('OutlinedButton'),),
          ],
        ),
      ),
    );
  }
  void showDialogue(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title:const Text('alert'),
        content: const Text('this is an alert Dialouge'),
        actions: [
          TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('return'))
        ],
      );
    });
  }
}
