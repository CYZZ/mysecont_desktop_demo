import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mysecont_desktop_demo/Practice/Calculation/Model/calculate_model.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  double _firstNum = 0;
  double _secondNum = 0;
  double _resultNum = 0;
  TextEditingController _textEditingController;
  List<CalculateHistory> _allHistory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("基本计算"),
          actions: [
            FlatButton(
              child: Icon(Icons.skip_next),
              onPressed: () {
                changeCalculateNum();
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              header(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return historyCell(_allHistory[index]);
                  },
                  itemCount: _allHistory.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                ),
                flex: 1,
              ),
            ],
          ),
        ));
  }

  changeCalculateNum() {
    _firstNum = _randomBit(3);
    _secondNum = _randomBit(3);
    setState(() {});
  }

  // 获取随机的整数
  double _randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return double.parse(result);
  }

  Widget historyCell(CalculateHistory history) {
    // CalculateHistory(code);
    return Text("记录：${history.firstNum}➕${history.secondNum}＝${history.resultNum}结果：${history.isTrue}");
  }

  // 头部组件
  Widget header() {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Row(
        // crossAxisAlignment: ,

        children: [
          Text(
            "$_firstNum",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "➕",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "$_secondNum",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "＝",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
              ],
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "请输入结果",
              ),
              style: TextStyle(fontSize: 20),
            ),
          ),
          RaisedButton(
            child: Text("提交答案"),
            onPressed: () {
              try {
                _resultNum = double.parse(_textEditingController.text);
                print("结果=$_resultNum");
              } catch (e) {
                print("错误$e");
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("数据有误"),
                      content: Text("答案的数据格式不是浮点型，请检查数据"),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              print("已经点击了确定按钮");
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                            },
                            child: Text("确定"))
                      ],
                    );
                  },
                );
              }
              // 开始对比结果
              if (_firstNum + _secondNum == _resultNum) {
                print("计算结果正确");
                _allHistory.insert(0, CalculateHistory(_firstNum, _secondNum, _resultNum, true, "2020", "20s"));
                // 下一题
                changeCalculateNum();
                _textEditingController.text = "";
              } else {
                print("计算结果有误");
                _allHistory.insert(0, CalculateHistory(_firstNum, _secondNum, _resultNum, false, "2020", "10s"));
              }
              setState(() {

              });
            },
          ),
        ],
      ),
      height: 200,
    );
  }
}
