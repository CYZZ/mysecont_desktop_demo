import 'package:flutter/material.dart';
import 'package:mysecont_desktop_demo/zhentong_futures/model/business_model.dart';
import 'package:mysecont_desktop_demo/zhentong_futures/model/business_network.dart';

class ZhenTongPage extends StatefulWidget {
  @override
  _ZhenTongPageState createState() => _ZhenTongPageState();
}

class _ZhenTongPageState extends State<ZhenTongPage> {
  BusinessModel _businessModel = BusinessModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBusinessData();
  }

  // 获取数据
  getBusinessData() {
    BusinessNetwork.getGoldValue((model) {
      setState(() {
        _businessModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    return Container(
//      child: _mainContainer(),
//    );
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
          title: Text("振通数据"),
          centerTitle: true,
          actions: [
            FlatButton(
              child: Icon(Icons.skip_next),
              onPressed: () {
                getBusinessData();
              },
            )
          ],
        ),
//      body: Text("${_businessModel.msg}"),
        body: _mainContainer(),
      ),
    );
  }

  Widget _mainContainer() {
    Widget listView = ListView.builder(
      itemBuilder: (context, index) => renderRow(index),
      itemCount: _businessModel?.data?.length ?? 0,
    );
    return listView;
  }

  Widget renderRow(index) {
    ProductModel product = _businessModel.data[index];
    double rate = (double.parse(product.p) - double.parse(product.j)) / double.parse(product.j);


    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  product.productName,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Expanded(
                  child: Text(""),
                  flex: 1,
                ),
                Text(
                  product.p,
                  style: TextStyle(fontSize: 15, color: rate > 0 ? Colors.red : Colors.green),
                ),
                Text(
                    "      涨跌幅：${(rate*100).toStringAsFixed(2)}%",style: TextStyle(color: rate>0 ? Colors.red : Colors.green),)
              ],
            ),
            Row(
              children: [
                Text(
                  product.desc,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  "是否热门${product.isHot.toString()}",
                  style: TextStyle(fontSize: 12, color: Colors.red),
                )
              ],
            ),
            Divider(
              height: 1.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
//      Row(
//        children: [
//
//          Text(product?.productName ?? ""),
//          Text(product?.p ?? "")
//        ],
//      ),
      onTap: () {
        print("点击了cell");
      },
    );
  }
}
