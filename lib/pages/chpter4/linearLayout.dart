import 'package:flutter/material.dart';

class linearLayout extends StatelessWidget {
  const linearLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('线性布局和弹性布局'),
        ),
        body: Container(
            color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: Container(
                //     color: Colors.red,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [Text("hawkins"), Text('stephen')],
                //     ),
                //   ),
                // ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("hawkins"), Text('stephen')],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: Container(height: 30, color: Colors.red)),
                    Expanded(
                      flex: 3,
                      child: Container(height: 30, color: Colors.yellow),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 100,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(height: 30, color: Colors.red),
                        ),
                        const Spacer(flex: 1),
                        Expanded(
                          flex: 1,
                          child: Container(height: 30.0, color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
