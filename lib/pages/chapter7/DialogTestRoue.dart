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

    Future<int?> showModalBottomSheetFn() {
      return showModalBottomSheet<int>(
          context: context,
          builder: (BuildContext context) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index));
              },
              itemCount: 30,
            );
          });
    }

    Future<void> showLoadingDialog() {
      return showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content:
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     CircularProgressIndicator(),
                    //     Padding(
                    //       padding: EdgeInsets.only(top: 26),
                    //       child: Text('正在加载中，请稍后！'),
                    //     )
                    //   ],
                    // ),
                    UnconstrainedBox(
              constrainedAxis: Axis.vertical,
              child: SizedBox(
                width: 280,
                height: 200,
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.only(top: 26.0),
                        child: Text("正在加载，请稍后..."),
                      )
                    ],
                  ),
                ),
              ),
            ));
          });
    }

    Future<DateTime?> showDataePicker1() {
      var date = DateTime.now();
      return showDatePicker(
          barrierDismissible: true,
          context: context,
          firstDate: date,
          lastDate: date.add(const Duration(days: 30)));
    }

    Future<DateTime?> showDatePicker2() {
      var date = DateTime.now();
      return showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              minimumDate: date,
              maximumDate: date.add(
                Duration(days: 30),
              ),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          );
        },
      );
    }

    Future<DateTime?> showDatePicker3() async {
      final date = DateTime.now();
      DateTime? chosenDate;

      return showCupertinoDialog<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPopupSurface(
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      minimumDate: date,
                      maximumDate: date.add(const Duration(days: 30)),
                      onDateTimeChanged: (DateTime value) {
                        chosenDate = value;
                      },
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop(chosenDate);
                    },
                    child: const Text('确认'),
                  ),
                ],
              ),
            ),
          );
        },
      );
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
                child: Text('对话框3')),
            ElevatedButton(
                onPressed: () async {
                  await showCustomDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('提示'),
                          content: Text('你要删除当前文件吗'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('取消')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('删除')),
                          ],
                        );
                      });
                },
                child: Text('对话框4')),
            DialogRoute(),
            ElevatedButton(
                onPressed: () async {
                  int? type = await showModalBottomSheetFn();
                  print(type);
                },
                child: Text('底部弹框')),
            ElevatedButton(
                onPressed: () async {
                  await showLoadingDialog();
                },
                child: const Text('加载弹窗')),
            ElevatedButton(
                onPressed: () async {
                  await showDataePicker1();
                },
                child: const Text('加载时间弹窗')),
            ElevatedButton(
                onPressed: () async {
                  DateTime? date = await showDatePicker2();
                  print(date);
                },
                child: const Text('加载ios时间弹窗')),
          ],
        ),
      ),
    );
  }
}

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  ThemeData? theme,
}) {
  final ThemeData theme = Theme.of(context);
  print('barrierDismissible $barrierDismissible');
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

class DialogRoute extends StatefulWidget {
  const DialogRoute({super.key});

  @override
  _DialogRouteState createState() => _DialogRouteState();
}

class _DialogRouteState extends State<DialogRoute> {
  Future<bool?> showDeleteConfirmDialog2() {
    bool _withTree = false; //默认复选框选不中
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('您确定要删除当前文件吗？'),
                Row(
                  children: [
                    const Text('同时删除子目录？'),
                    // Checkbox(//这种清空复选框选不中
                    //     value: withTree,
                    //     onChanged: (bool? value) {
                    //       setState(() {
                    //         withTree = !withTree;
                    //       });
                    //     })

                    // StatefulBuilder(builder: (context, setState) {
                    //   //方法一正常打勾
                    //   return Checkbox(
                    //       value: _withTree,
                    //       onChanged: (bool? value) {
                    //         setState(() {
                    //           _withTree = !_withTree;
                    //         });
                    //       });
                    // })

                    Checkbox(
                        //方法三正常打勾
                        value: _withTree,
                        onChanged: (bool? value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        })
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('取消')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(withTree);
                  },
                  child: const Text('删除'))
            ],
          );
        });
  }

  bool withTree = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              bool? delete = await showDeleteConfirmDialog2();
              if (delete != null) {
                print('取消删除');
              } else {
                print('同时删除子目录：${delete}');
              }
            },
            child: const Text('对话框5'))
      ],
    );
  }
}
