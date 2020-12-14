import 'package:flutter/material.dart';
import 'package:route_annotation/route_annotation.dart';

@RoutePage(params: [RouteParameter("title")])
class OneArgumentPage extends StatelessWidget {
  final String title;

  const OneArgumentPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("只有单参数的页面"),
      ),
      body: Container(
        child: Text("收到的标题是:$title"),
      ),
    );
  }
}
