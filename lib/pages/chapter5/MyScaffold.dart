import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
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
        title: Text("App Name"),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.dashboard, color: Colors.black87));
        }),
      ),
      drawer: MyDrawer(), //抽屉
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
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            SizedBox(), //中间位置流出
            IconButton(onPressed: () {}, icon: Icon(Icons.business))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.home),
          shape: CircleBorder(),
          onPressed: _onAdd),
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
            Text(
              "Hawkins",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.add),
        title: const Text('Add Account'),
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Manage Account'),
      )
    ]));
  }
}
