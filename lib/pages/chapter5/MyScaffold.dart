import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<MyScaffold> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.dashboard, color: Colors.black87));
        }),
      ),
      drawer: const MyDrawer(), //抽屉
      // bottomNavigationBar: BottomNavigationBar(
      //   // 底部导航
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.business), label: 'Business'),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.black87,
      //   onTap: _onItemTapped,
      // ),

      // 指定打洞位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            const SizedBox(), //中间位置流出
            IconButton(onPressed: () {}, icon: const Icon(Icons.business))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          shape: const CircleBorder(),
          onPressed: _onAdd,
          //悬浮按钮
          child: const Icon(Icons.home)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/lahe.jpg',
                  width: 80,
                ),
              ),
            ),
            const Text(
              "Hawkins",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      const ListTile(
        leading: Icon(Icons.add),
        title: Text('Add Account'),
      ),
      const ListTile(
        leading: Icon(Icons.settings),
        title: Text('Manage Account'),
      )
    ]));
  }
}
