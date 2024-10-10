import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogTestRoue extends StatelessWidget {
  const DialogTestRoue({super.key});
  @override
  Widget build(BuildContext context) {
    Future<bool?> showDeleteConfirmDialog1() {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('提示'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('取消')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text('删除'))
              ],
              content: Text('您确定要删除当前文件吗'),
            );
          });
    }

    Future<void> changeLanguage() async {
      int? i = await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('请选择语言'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 1);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('简体中文'),
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, 2);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text('美国英语'),
                  ),
                ),
              ],
            );
          });
      if (i != null) {
        print('选择了：${i == 1 ? "中文简体" : "美国英语"}');
      }
    }

    Future<void> showListDialog() async {
      int? index = await showDialog<int>(
          context: context,
          builder: (BuildContext context) {
            var child = Column(
              children: [
                const ListTile(
                  title: Text('请选择'),
                ),
                Expanded(child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text('选择项$index'),
                      onTap: () => Navigator.of(context).pop(index));
                }))
              ],
            );
            //使用AlertDialog会报错
            //return AlertDialog(content: child);
            return Dialog(child: child);
          });
      if (index != null) {
        print('点击了$index');
      }
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('dialog详解'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  bool? delete = await showDeleteConfirmDialog1();
                  if (delete != null) {
                    print('确认删除');
                  } else {
                    print('取消删除');
                  }
                },
                child: const Text('对话框1')),
            ElevatedButton(
                onPressed: () async {
                  await changeLanguage();
                },
                child: Text('对话框2')),
            ElevatedButton(
                onPressed: () async {
                  await showListDialog();
                },
                child: Text('对话框3'))
          ],
        ),
      ),
    );
  }
}
