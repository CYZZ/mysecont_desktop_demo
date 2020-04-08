import 'package:flutter/material.dart';
import '../my_gold/gold_model/gold_network.dart';
import '../my_gold/gold_model/goldmodel.dart';
import '../util_widget/candle_stick.dart';

class GoldPage extends StatefulWidget {
  @override
  _GoldPageState createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  GoldData data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            child: Icon(Icons.print),
            onPressed: () {
              print("点击了左边按钮");
              GoldNetWork.getGoldValue((model) {
                this.data = model.data;
                setState(() {});
              });
            },
          ),
        ),
        body: contentBody(),
      ),
    );
  }

  Widget contentBody() {
    return Column(
      children: <Widget>[
        Text(data?.toString() ?? "hello"),
        CustomPaint(
          painter: goldCandleStick(),
          size: Size(30,100),
        )
      ],
    );
  }

  CandleStick goldCandleStick() {
    if (data != null) {
      return CandleStick(data.mostHigh, data.mostLow,
          data.open, data.close);
    } else {
      return CandleStick(20, 20, 20, 20);
    }
  }
}
