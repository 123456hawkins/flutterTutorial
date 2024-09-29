import 'package:flutter/material.dart';

class stackLayout extends StatelessWidget {
  const stackLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('层叠布局(Stack和positioned)')),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: 400, minWidth: double.infinity),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.red,
                  child: const Text('hello world',
                      style: TextStyle(color: Colors.green)),
                ),
                const Positioned(left: 18, child: Text('i am hawkins')),
                const Positioned(
                  top: 18,
                  child: Text('your friend'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // ConstrainedBox(
          //   constraints:
          //       const BoxConstraints(minHeight: 400, minWidth: double.infinity),
          //   child: Stack(
          //     alignment: Alignment.center,
          //     fit: StackFit.expand, //未定位widget占满Stack整个空间
          //     children: <Widget>[
          //       const Positioned(
          //         left: 18.0,
          //         child: Text("I am Jack"),
          //       ),
          //       Container(
          //         color: Colors.red,
          //         child: const Text("Hello world",
          //             style: TextStyle(color: Colors.white)),
          //       ),
          //       const Positioned(
          //         top: 18.0,
          //         child: Text("Your friend"),
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
