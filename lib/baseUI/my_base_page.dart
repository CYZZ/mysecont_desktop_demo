import 'package:flutter/material.dart';

class MyBasePage extends StatefulWidget {
  @override
  _MyBasePageState createState() => _MyBasePageState();
}

class _MyBasePageState extends State<MyBasePage> {
  static Widget avatar = Image.asset(
    "lib/images/mytestIcon.jpeg",
    height: 70,
  );

  // 列表组件数组
  List<Widget> bodyWidgets = [
    Text("hello world"),
    FlatButton(
      onPressed: () {},
      child: Text("normal"),
    ),
    OutlineButton(
      onPressed: () {},
      child: Text("outLineButton"),
    ),
    avatar,
    ClipOval(
      child: Image.asset(
        "lib/images/mytestIcon.jpeg",
        height: 70,
        fit: BoxFit.fitHeight,
      ),
    ),
    ClipRRect(
      child: Image.asset(
        "lib/images/mytestIcon.jpeg",
        height: 70,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    ClipRect(
      clipper: MyClipper(),
      child: avatar,
    ),
//    Scrollbar(
//      ,
//      child: Center(
//        child: Row(
//          children: "ABCDEFGHIJKLMJOPQRSTUVWXYZ"
//              .split("")
//              .map((e) => Text(e, textScaleFactor: 2.0))
//              .toList(),
//        ),
//      ),
//    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("测试页面"),
          centerTitle: true,
        ),
        body: _mainContainer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _mainContainer() {
    Widget listView = ListView.builder(
      itemBuilder: (context, index) => renderRow(index),
      itemCount: bodyWidgets.length,
    );
    return listView;
  }

  Widget renderRow(int index) {
    return Container(
        child: Row(
      children: [
        bodyWidgets[index],
//          Text("测试看看")
      ],
    ));
//  return bodyWidgets[index];
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTWH(10, 15, 50, 40); // 裁剪只去指定区域的图片
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
