import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/mock_api.dart';

class FutureBuilderTestRoute extends StatelessWidget {
  const FutureBuilderTestRoute({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('异步ui更新'),
      ),
      body: Center(
          child: Column(
        children: [
          FutureBuilder(
              future: mockNetworkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                //   请求结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error:${snapshot.error}');
                  } else {
                    //   请求成功，显示数据
                    return Text('Content:${snapshot.data}');
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          StreamBuilderTestRoute()
        ],
      )),
    );
  }
}

class StreamBuilderTestRoute extends StatelessWidget {
  const StreamBuilderTestRoute({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<double>(
        stream: StreamCounter(),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          if (snapshot.hasError) return Text('请求错误');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据');
            case ConnectionState.active:
              // return Text('active,${snapshot.data}');
              return CircularProgressIndicator(value: snapshot.data);
            case ConnectionState.done:
              return Text('stream关闭');
          }
        });
  }
}
