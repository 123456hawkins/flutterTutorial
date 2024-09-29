import 'package:flutter/material.dart';

Widget redBox =
    const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

class constraints extends StatelessWidget {
  const constraints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局原理与约束'),
        actions: const [
          SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // 约束盒子
            ConstrainedBox(
              constraints:
                  const BoxConstraints(minWidth: double.infinity, minHeight: 66.0),
              child: SizedBox(
                height: 5,
                child: redBox,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(width: 66, height: 66, child: redBox),
            const SizedBox(height: 20),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: 20.0, minHeight: 20.0),
                    child: redBox,
                  ),
                )),
            UnconstrainedBox(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  children: [Text('xx' * 30)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
