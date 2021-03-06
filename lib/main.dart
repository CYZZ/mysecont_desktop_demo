import 'package:flutter/material.dart';
import 'package:mysecont_desktop_demo/Practice/Calculation/calculate_page.dart';
import 'package:mysecont_desktop_demo/baseUI/my_base_page.dart';
import 'package:mysecont_desktop_demo/main.route.dart';
import 'package:mysecont_desktop_demo/my_gold/gold_model/gold_network.dart';
import 'package:mysecont_desktop_demo/util_widget/candle_stick.dart';
import 'package:mysecont_desktop_demo/zhentong_futures/zhentong_page.dart';
import 'package:route_annotation/route_annotation.dart';
import 'my_gold/gold_model/goldmodel.dart';
import 'zhentong_futures/model/business_network.dart';

void main() {
  runApp(MyApp());
}

@router
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  GoldModel _model;
  bool _active = false;
  bool _checkBoxValue = false;

  void _incrementCounter() {
    GoldNetWork.getGoldValue((data) {
      print("网络请求结果在main中收到data = $data");
      setState(() {
        _model = data;
      });
    });
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ZhenTongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              painter: CandleStick(
                  _model?.data?.mostHigh ?? 0,
                  _model?.data?.mostLow ?? 0,
                  _model?.data?.close ?? 0,
                  _model?.data?.open ?? 0),
              size: Size(30, 100),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
            ),
            GestureDetector(
              onTap: _handleTap,
              child: Container(
                child: Center(
                  child: Text(
                    _active ? 'Active' : 'Inactive',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名或者手机号",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            RaisedButton(
              child: Text("算数练习"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CalculatePage(),
                  ),
                );
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ROUTE_MEMORY_PAGE,
                  arguments: {
                    "title": "记录的标题",
                    "subTitle": "副标题进行描述",
                  },
                );
                // RouteParameter("title"), RouteParameter("subTitle")]
              },
              child: Text("打开记录页面"),
            ),
            OutlineButton(
              onPressed: () {},
              child: Text("outLineButton"),
            ),
            IconButton(
              icon: Icon(Icons.timer),
              onPressed: () {},
            ),
            RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text("raiseicon")),
            Checkbox(
              value: _checkBoxValue,
              onChanged: (value) {
                setState(() {
                  _checkBoxValue = value;
                });
                print("当前的value=$value");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
