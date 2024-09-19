import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class stackLayout extends StatelessWidget {
  const stackLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('层叠布局(Stack和positioned)')),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: 400, minWidth: double.infinity),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Text('hello world',
                      style: TextStyle(color: Colors.green)),
                  color: Colors.red,
                ),
                Positioned(left: 18, child: Text('i am hawkins')),
                Positioned(
                  child: Text('your friend'),
                  top: 18,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: 400, minWidth: double.infinity),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                const Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(
                  color: Colors.red,
                  child: const Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                ),
                const Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
