
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget{
  const TextPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('home Page'),),
      body: Center(child: Text('welcome to textPage'),),
    );

  }

}
