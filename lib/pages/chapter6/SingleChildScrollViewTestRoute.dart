import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({super.key});
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
        appBar: AppBar(title: const Text('SingleChildScrollView')),
        body: Scrollbar(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: str
                        .split("")
                        .map((c) => Text(
                              c,
                              textScaleFactor: 2,
                            ))
                        .toList(),
                  ),
                ))));
  }
}
