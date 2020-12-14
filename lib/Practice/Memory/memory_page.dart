import 'package:flutter/material.dart';
import 'package:mysecont_desktop_demo/main.route.dart';
import 'package:route_annotation/route_annotation.dart';

@RoutePage(params: [RouteParameter("title"), RouteParameter("subTitle")])
class MemoryPage extends StatefulWidget {
  final String title;
  final String subTitle;

  MemoryPage({this.title, Key key, this.subTitle}) : super(key: key);

  @override
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("记录"),
          actions: [
            FlatButton(
              child: Icon(Icons.skip_next),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ROUTE_ONE_ARGUMENT_PAGE, arguments: "只有一个参数的标题");
              },
            )
          ],
        ),
        body: Container(
          child: Text("title=${widget.title},subtitle=${widget.subTitle}"),
        ));
  }
}
