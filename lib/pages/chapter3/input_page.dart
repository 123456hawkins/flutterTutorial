import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('输入框和表单'),
      ),
      body: Center(
        child: Column(children: [InputForm()]),
      ),
    );
  }
}

class InputForm extends StatefulWidget {
  InputForm({super.key});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _selectionController = TextEditingController();
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;
  @override
  void initState() {
    super.initState();
    //   添加监听器，监听输入变化
    _unameController.addListener(() {
      print('当前用户名：${_unameController.text}');
    });
    _selectionController.text = 'sersggert1234serg而乏味';
    _selectionController.selection = TextSelection(
        baseOffset: 3, extentOffset: _selectionController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        autofocus: true,
        focusNode: focusNode1,
        controller: _unameController,
        contextMenuBuilder:
            (BuildContext context, EditableTextState editableTextState) {
          return AdaptiveTextSelectionToolbar(
              anchors: editableTextState.contextMenuAnchors,
              children: [
                TextButton(
                    onPressed: () {
                      editableTextState
                          .copySelection(SelectionChangedCause.toolbar);
                      // Navigator.pop(context);
                    },
                    child: const Text('复制文本'))
              ]);
        },
        decoration: const InputDecoration(
            labelText: "用户名",
            hintText: "用户名和邮箱",
            prefixIcon: Icon(Icons.person)),
      ),
      TextField(
        onChanged: (v) {
          print('onchange:$v');
        },
        autofocus: true,
        focusNode: focusNode2,
        controller: _unameController,
        decoration: const InputDecoration(
            labelText: "用户名",
            hintText: "用户名和邮箱",
            prefixIcon: Icon(Icons.person_2_rounded)),
      ),
      TextField(
        onChanged: (v) {
          print('onchange:$v');
        },
        autofocus: true,
        controller: _selectionController,
        decoration: const InputDecoration(
            labelText: "123",
            hintText: "用户名和邮箱",
            prefixIcon: Icon(Icons.car_crash)),
      ),
      const TextField(
        autofocus: true,
        decoration: InputDecoration(
            labelText: "密码", hintText: "您的登录密码", prefixIcon: Icon(Icons.lock)),
        // 隐藏文本
        obscureText: true,
      ),
      Builder(
        builder: (ctx) {
          return Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    focusScopeNode ??= FocusScope.of(context);
                    focusScopeNode?.requestFocus(focusNode2);
                  },
                  child: const Text('移动焦点')),
              ElevatedButton(
                  onPressed: () {
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                  child: const Text('隐藏键盘'))
            ],
          );
        },
      )
    ]);
  }
}
