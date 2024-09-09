
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget{
  const TextPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('text Page'),),
      body: Center(child: Column(
        children: [
           const Text('hello world',textAlign: TextAlign.left),
        const Text("Hello world! I'm Jack.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
          Text('hello world',style:TextStyle(fontSize: 24,color: Colors.blue,height: 2.4,fontFamily: 'Courier',background: Paint()..color=Colors.yellow,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.dashed) ),
          const Text.rich(TextSpan(children: [
            TextSpan(text:"Home"),
            TextSpan(text: "https://www.baidu.com",style: TextStyle(color: Colors.blue))
          ])),
          DefaultTextStyle(
              // 设置默认样式
              style: TextStyle(color: Colors.red,fontSize: 20,background:Paint()..color=Colors.green)
              ,textAlign: TextAlign.start, child: const Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[Text("继承样式文字"),Text("i am jack"),Text('i am hawkins')])),
          const Text('Eric Hawkins',style: TextStyle(fontFamily: 'fontFamily1',fontSize: 60)),
          const Text('Eric Hawkins',style: TextStyle(fontFamily: 'fontFamily2',fontSize: 70)),
          const Text('Eric Hawkins',style: TextStyle(fontFamily: 'fontFamily2',fontWeight: FontWeight.w500)),
        ],
      )),
    );

  }

}
