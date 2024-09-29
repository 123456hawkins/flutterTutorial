import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_project/pages/chapter3/ProgressPage.dart';
import 'package:flutter_project/pages/chapter3/button_page.dart';
import 'package:flutter_project/pages/chapter3/c3main.dart';
import 'package:flutter_project/pages/chapter3/image_page.dart';
import 'package:flutter_project/pages/chapter3/input_page.dart';
import 'package:flutter_project/pages/chapter3/switch_page.dart';
import 'package:flutter_project/pages/chapter5/c5main.dart';
import 'package:flutter_project/pages/chapter5/MyScaffold.dart';
import 'package:flutter_project/pages/chapter5/paddingAndDecorated.dart';
import 'package:flutter_project/pages/chapter6/AnimatedListRoute.dart';
import 'package:flutter_project/pages/chapter6/C6main.dart';
import 'package:flutter_project/pages/chapter6/GridViewRoute.dart';
import 'package:flutter_project/pages/chapter6/ListViewTestRoute.dart';
import 'package:flutter_project/pages/chapter6/PageVeiwRoute.dart';
import 'package:flutter_project/pages/chapter6/ScrollerMonitor.dart';
import 'package:flutter_project/pages/chapter6/SingleChildScrollViewTestRoute.dart';
import 'package:flutter_project/pages/chpter4/alignLayout.dart';
import 'package:flutter_project/pages/chpter4/c4main.dart';
import 'package:flutter_project/pages/chpter4/constraints.dart';
import 'package:flutter_project/pages/chpter4/flowAndWrap.dart';
import 'package:flutter_project/pages/chpter4/layoutB.dart';
import 'package:flutter_project/pages/chpter4/linearLayout.dart';
import 'package:flutter_project/pages/chpter4/stackLayout.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_project/pages/chapter3/TextPage.dart';

void main() {
  // 应用入口
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Flutter Home');
      },
      routes: [
        GoRoute(
            path: 'tip_route',
            builder: (BuildContext context, GoRouterState state) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
              final message = args?['message'] ?? '';
              return TipRoute(text: message);
            }),
        GoRoute(
            path: 'new_route',
            builder: (BuildContext context, GoRouterState state) {
              return const NewRoute();
            }),
        GoRoute(
            path: 'chapter_three',
            builder: (BuildContext context, GoRouterState state) {
              return const c3main();
            },
            routes: [
              GoRoute(
                  path: 'textPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const TextPage();
                  }),
              GoRoute(
                  path: 'buttonPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const button_page();
                  }),
              GoRoute(
                  path: 'imagePage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const image_page();
                  }),
              GoRoute(
                  path: 'switchPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const switch_page();
                  }),
              GoRoute(
                  path: 'inputPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const InputPage();
                  }),
              GoRoute(
                  path: 'progressPage',
                  builder: (BuildContext context, GoRouterState state) {
                    return const ProgressPage();
                  })
            ]),
        GoRoute(
            path: 'chapter_four',
            builder: (BuildContext context, GoRouterState state) {
              return const c4main();
            },
            routes: [
              GoRoute(
                  path: 'constraints',
                  builder: (BuildContext context, GoRouterState state) {
                    return const constraints();
                  }),
              GoRoute(
                  path: 'linearLayout',
                  builder: (BuildContext context, GoRouterState state) {
                    return const linearLayout();
                  }),
              GoRoute(
                  path: 'flowAndWrap',
                  builder: (BuildContext context, GoRouterState state) {
                    return const flowAndWrap();
                  }),
              GoRoute(
                  path: 'stackLayout',
                  builder: (BuildContext context, GoRouterState state) {
                    return const stackLayout();
                  }),
              GoRoute(
                  path: 'alignLayout',
                  builder: (BuildContext context, GoRouterState state) {
                    return const alignLayout();
                  }),
              GoRoute(
                  path: 'layoutB',
                  builder: (BuildContext context, GoRouterState state) {
                    return const layoutB();
                  })
            ]),
        GoRoute(
            path: 'chapter_five',
            builder: (BuildContext context, GoRouterState state) {
              return const c5main();
            },
            routes: [
              GoRoute(
                  path: 'paddingAndDecorated',
                  builder: (BuildContext context, GoRouterState state) {
                    return const paddingAndDecorated();
                  }),
              GoRoute(
                  path: 'myScaffold',
                  builder: (BuildContext context, GoRouterState state) {
                    return const MyScaffold();
                  }),
            ]),
        GoRoute(
            path: 'chapter_six',
            builder: (BuildContext context, GoRouterState state) {
              return const C6main();
            },
            routes: [
              GoRoute(
                  path: 'SingleChildScrollViewTestRoute',
                  builder: (BuildContext context, GoRouterState state) {
                    return const SingleChildScrollViewTestRoute();
                  }),
              GoRoute(
                  path: 'ListView',
                  builder: (BuildContext context, GoRouterState state) {
                    return const ListViewTestRoute();
                  }),
              GoRoute(
                  path: 'ScrollerMonitor',
                  builder: (BuildContext context, GoRouterState state) {
                    return const ScrollerMonitor();
                  }),
              GoRoute(
                  path: 'AnimatedList',
                  builder: (BuildContext context, GoRouterState state) {
                    return const AnimatedListRoute();
                  }),
              GoRoute(
                  path: 'GridViewRoute',
                  builder: (BuildContext context, GoRouterState state) {
                    return const GridViewRoute();
                  }),
              GoRoute(
                  path: 'PageView',
                  builder: (BuildContext context, GoRouterState state) {
                    return const PageViewRoute();
                  })
            ])
      ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
    //     useMaterial3: true,
    //   ),
    //   // initialRoute:"/", //名为"/"的路由作为应用的home(首页)
    //   // routes: {
    //   //   "new_route":(context)=>const NewRoute(),
    //   //   "tip_route":(context){
    //   //     final args=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;
    //   //     final message=args?['message']??'';
    //   //     return TipRoute(text: message);},
    //   //   "/":(context)=>const MyHomePage(title: 'Flutter Home')
    //   // },
    //   // 路由钩子
    //   // onGenerateRoute: (RouteSettings settings){
    //   //   return MaterialPageRoute(builder: (context){
    //   //     String routeName=settings.name??'/';
    //   //     // bool isLoggedIn=false;
    //   //     switch(routeName){
    //   //       case '/':
    //   //         return const MyHomePage(title: 'Flutter Home');
    //   //       case 'tip_route':
    //   //         final args=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>?;
    //   //         final message=args?['message']??'';
    //   //         return TipRoute(text: message);
    //   //       case 'new_route':
    //   //         return const NewRoute(); // 处理未定义的路由
    //   //       default:
    //   //         return const MyHomePage(title: 'Flutter Home');
    //   //     }
    //   //
    //   //
    //   //   });
    //   // },
    //   // home: const MyHomePage(title: ' Test Page'),
    //   // home: const GetStateObjectRoute(),
    //
    // );
    return MaterialApp.router(routerConfig: _router);
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final message = args?['message'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Route'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text('This is new route'),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('点我跳转回去')),
          Row(
            children: [
              const Text('路由传来的text:'),
              Text(
                text == '' ? message : "",
                style: const TextStyle(color: Colors.red),
              )
            ],
          )
        ],
      )),
    );
  }
}

// tipRoute用于接受路由携带的参数
class TipRoute extends StatelessWidget {
  const TipRoute({super.key, this.text = ''});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由传参测试'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(text),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pop(context, 'caocoacaocaocaooacaoa'),
                child: const Text('点我返回'))
          ],
        ),
      ),
    );
  }
}

//测试statelessWidget
class Echo extends StatelessWidget {
  const Echo({
    super.key,
    required this.text,
    this.backgroundColor = Colors.grey,
  });
  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

// 通过build方法中的context参数查找祖先widget信息
class FindAncestorWidget extends StatelessWidget {
  const FindAncestorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
        if (scaffold != null && scaffold.appBar is AppBar) {
          return (scaffold.appBar as AppBar).title ?? const Text('No Title');
        } else {
          return const Text('No Scaffold or AppBar found');
        }
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState方法会自动通知Flutter进行build
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  void initState() {
    super.initState();
    //   初始化状态
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    const String base64String =
        'iVBORw0KGgoAAAANSUhEUgAAAfQAAADICAMAAAApx+PaAAAC/VBMVEUAAABeTypdTh81M3wuMXsyMnofKnkgK3kfKnkxMn1bTSIvMXofK3ogLHskLnoKFW5eTxJfUBICCGEzQJNudrZIS5AiLX1eTxJfTxJeTxJeTxFaWZb///++v72Ih4GpqKTJysqYnc6gnb7a2e20tdiEjMU/PYwaJHJeTxFxZit9dTpVU04AAAAMER8kIAR1XkGonn/6+e7o6virqclhUhSzq479/Po7OoWPjbc2S7gkJ1oCBEwEBg9PQCuUlI04MSRwbGrQ0dqgl3K8tp7FwateTxH18v14keEQDQUrOYw5SKZGYdYREGEaFhDp6eMlIyNGQ0FkXlvE0vleTxLRzrzy7NHg0IzWxG7Wv2Hv5b9dThLd3NOdnpt9d3U0NTosJ2gVHF2zs6+Bfau/wOH28uIYIWpeTxKHc0zMrz3EoyM+ZqYmKnJraJ8mKYcdJGrEk53m2J/IqjOdkWzKwYJ0dosXHokXG0Xxqazji5UpMHpSWW+OgmGTuvlPhdc/WsZLbOtemfgOFjS4d4Grjh7Os0kuMHjSulS9nSEwMINsXBafhBxUjeFnWBh5Zhe0liC6nSzsyp/GoXCad0heTxGSehuFcBpFcbdASFnSqXKnglKzjlu/mmnesni4lGViUTMfH1H//7mJZTPv5Z9JQA82LwXzwID//s7cklY8Nnr99qdzYRePh0J1YyO3q1nWuZSwliynix0zM3rq00/97Xp6bDnt3a6IcRgrMHqclVDdzHfHpyrDumT/yOH7vsrcp65AOH2Og1c5N4AyMnjk4to4NXvs3fT///89iOk4etv///82M3pFOnqBaxc5NXxYk+1LfssnRG////5COXy+tGFmpv+tpFUzV4z///+gdawjFWLGqM80LXA/NntKOnvMr4qilC6ThyhGOXrZwuBEOHmbXKFOPnqBSI5YQHliQ3p2TZhTPnlnL4V9T5lwR4Owh7x1OYqDUpo9JF6LVJpTM2iRV5uHUpmHV5qrY6v/+i////v//vD///////////////+kNdNZAAAA/3RSTlMADCxCYH2UrsfjGv//////U3z//////2ew/+//////////////////3/7+/////////////fz////////////////J/P3B/////////////////6D///////9A//////////////+N/v/////////////9/f///////////////////////////////+3//+/////R/////////////////////////////93/pv//neD////U/+n////////////d///Q///r///b/6PH/////4HI/v///8P///////////////////////////////////////+X//8aRFFlpTLr+11LAABtX0lEQVR4AezSh2FDMQgFQCQQD+mD4uw/bHrvPbbFzXCUUkoppZRSSt9WKktTVQBm1q/Zy/ARCqhqa00u8K1aRyn039JgUdjmLwn/cTHno1DAS4304wCDNmGuhd6XBjfY9P0SHuFfMju08aD0miFq049Rh0ql9ERhNT9uplzoVhqCzVewoTERpSEIX0hXHrQ2wfTlTMigVbF2X9RUpgUVMf9ZESeX/ECY0CEau9NdoS9hnf7DIs6psYrshmEgWkap00ysccYYZmbm5P43Kvl1UzaU/l746UkY1zRNAQEiCPkP6v30MKBhbmP6LxVEgh9gxH7f5B4ITct23GQqncnm8ogFCvQPA/CDmrk5C/J81w1+QOIXaD8qcqlcNph9s34aWZMX4AkFj3NlVaq1quvWG82W1dYApW/mCFDrZLO5OCIC+ZRLwduLz0X9064zd8vlEhtHPx7tzD3Lsvo9Zl+KO4yIcikAEWiQV0pJRBAgLKc6HI0rNTGZTmc9q60wQEFk5ovF0l6lUyn6TDQEiAX5vB1EoUxT0QcRI4mkpFeTnvrMSeZ1y7KsDfNPs17krfWEDe/8uPw6vL0LXgKrVGZveWhnTcR73s3EIY1zXeMnS3cFwxDT0Q+QICUJL1oJsYEZGDw1BIawuaQm7sWlhujpItya5ELJntxmIUuDS0hbtfsae5bu/dPu+7FMNAoa2uMjzIzb8DG/ed7lm8H1KjgOy90mj+i1mY6AT02UiidyXbVBofSrIRAECBE8rDvXyRDynfV6Q/ZvKhG1ss3l8uN/6fRrhxhK20BVUV3Ya+HPnn2iSr6dfZlk1cFaNpf5DnzlzqOvdR0jZC97fMPl2zN/ytuGXLr1oLlrlWZCunt6jcG+oLFX4ye6+jroPcyYgBGt/eCxWgegm8gNRfekWCY5+pUaV64d9EGv67DC5+8Bo5+8XjrEK8KtmpYs9kqFp63O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';
    Uint8List imageBytes = base64Decode(base64String);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FindAncestorWidget(),
              const Echo(text: 'stateless  widget'),
              const Text(
                'you has press num:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.memory(imageBytes),
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return NewRoute(text:'chuanguoqu');
                    //   },maintainState: true,fullscreenDialog: true),
                    // );
                    // Navigator.pushNamed(context, '/new_route',arguments: {'message':"命名路由传来的参数"});
                    context.go('/new_route?message=命名路由传来的参数');
                  },
                  child: const Text('点我跳转新页面')),

              // ElevatedButton(onPressed: ()async{var result=await Navigator.pushNamed(context, '/tip_route',arguments: {'message':'This is a tip message'});print('路由返回值:$result');}, child: const Text('打开提示页')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/tip_route?message=新路由');
                  },
                  child: const Text('打开提示页')),
              // RandomWordsWidget(),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_three');
                  },
                  child: const Text('跳转第三章')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_four');
                  },
                  child: const Text('跳转第四章')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_five');
                  },
                  child: const Text('跳转第五章')),
              ElevatedButton(
                  onPressed: () {
                    context.go('/chapter_six');
                  },
                  child: const Text('跳转第六章')),
            ],
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Positioned(
                bottom: 80.0,
                right: 10.0,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )),
            Positioned(
                bottom: 80.0,
                right: 80.0,
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.delete),
                )),
            Positioned(
                bottom: 80.0,
                right: 150.0,
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.delete),
                ))
          ],
        ));
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});
  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('子树中获取State对象'),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    ScaffoldState state =
                        context.findAncestorStateOfType<ScaffoldState>()!;
                    //   打开抽屉
                    state.openDrawer();
                  },
                  child: const Text('打开抽屉菜单'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  // 直接通过of静态方法来获取ScaffoldState
                  ScaffoldState state = Scaffold.of(context);
                  // 打开抽屉菜单
                  state.openDrawer();
                },
                child: const Text('打开抽屉菜单2'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("我是SnackBar")),
                  );
                },
                child: const Text('显示SnackBar'),
              );
            }),
            Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(16.0),
                color: Colors.red,
                child: const Text('i am a container')),
            TextButton(
                onPressed: () => print('handlePress'), child: const Text('按我')),
            CupertinoButton(
                child: const Text('APPLE BUTTON'),
                onPressed: () => print('handlePress')),
            const TapboxA(),
            // ParentWidget(),
            const ParentWidgetC()
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

// tapboxA管理自身状态
class TapboxA extends StatefulWidget {
  const TapboxA({super.key});
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Text(_active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white)),
      ),
    );
  }
}

//ParentWidget为TapbooxB管理状态
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(onChanged: _handleTapboxChanged, active: _active),
    );
  }
}

// tapboxB
class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[800] : Colors.grey[900]),
        child: Center(
          child: Text(active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 32, color: Colors.white)),
        ),
      ),
    );
  }
}

// 混合状态管理
class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({super.key});

  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------
class TapboxC extends StatefulWidget {
  const TapboxC({super.key, this.active = false, required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active
              ? Colors.lightBlue[888]
              : Colors.lightGreenAccent[335],
          border: _highlight
              ? Border.all(color: Colors.teal[100]!, width: 10)
              : null,
        ),
        child: Text(
          widget.active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  const RandomWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
        padding: const EdgeInsets.all(8.0), child: Text(wordPair.toString()));
  }
}
