import 'package:flutter/material.dart';

class switch_page extends StatelessWidget {
  const switch_page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('单选开关和复选开关'),
      ),
      body: const Scrollbar(
          child: SingleChildScrollView(
              child: Center(
        child: Column(
          children: [SwitchAndCheckBox()],
        ),
      ))),
    );
  }
}

class SwitchAndCheckBox extends StatefulWidget {
  const SwitchAndCheckBox({super.key});
  @override
  _SwitchAndCheckBox createState() => _SwitchAndCheckBox();
}

class _SwitchAndCheckBox extends State<SwitchAndCheckBox> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
            value: _switchSelected,
            activeColor: Colors.green,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            })
      ],
    );
  }
}
