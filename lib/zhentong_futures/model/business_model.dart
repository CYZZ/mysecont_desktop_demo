class BusinessModel {
  int code;
  String msg;
  String time;
  List<ProductModel> data;

  static BusinessModel fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    BusinessModel model = BusinessModel();
    model.code = map['code'];
    model.msg = map['msg'];
    model.data = [];
    List dataList = map["data"];
    dataList?.forEach((element) {
      model.data.add(ProductModel.fromMap(element));
    });
    return model;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {"code": code, "msg": msg, "data": data.toString()}.toString();
  }
}

class ProductModel {
  String businessDate;
  int id;
  String productName;
  String symbol;
  String contract;
  int handAmount;
  String tradeTime;
  String desc;
  int isHot;
  int currencyType;
  String p; // 当前价
  String j; // 开盘价
  String h; // 最高价
  String l; // 最低价

  static ProductModel fromMap(Map map) {
    if (map == null) return null;
    ProductModel model = ProductModel();
    model.businessDate = map["business_date"];
    model.id = map["id"];
    model.productName = map["product_name"];
    model.symbol = map["symbol"];
    model.contract = map["contract"];
    model.handAmount = map["hand_amount"];
    model.tradeTime = map["trade_time"];
    model.desc = map["desc"];
    model.isHot = map["is_hot"];
    model.currencyType = map["currency_type"];

    model.p = map["p"];
    model.j = map["j"];
    model.h = map["h"];
    model.l = map["l"];
    return model;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {
      "business_date": businessDate,
      "id": id,
      "product_name": productName,
      "symbol": symbol,
      "contract": contract,
      "hand_amount": handAmount,
      "trade_time": tradeTime,
      "is_hot": isHot,
      "currency_type": currencyType,
      "p": p,
      "j": j,
      "h": h,
      "l": l,
    }.toString();
  }
}

//{
//"code": 200,
//"msg": "获取国际期货列表成功",
//"time": "1586682406",
//"data": [
//{
//"business_date": "4/7,4/7,4/8,4/9,4/10",
//"id": 43,
//"product_name": "国内原油",
//"symbol": "SCML",
//"contract": "SC2005",
//"hand_amount": 1000,
//"trade_time": "a:3:{i:0;a:2:{i:0;s:4:\"9:00\";i:1;s:5:\"10:15\";}i:1;a:2:{i:0;s:5:\"10:30\";i:1;s:5:\"11:30\";}i:2;a:2:{i:0;s:5:\"13:30\";i:1;s:5:\"15:00\";}}",
//"desc": "国内原油,波动明显",
//"is_hot": 1,
//"currency_type": 4,
//"p": "290",
//"j": "300.2",
//"h": "295.0",
//"l": "286.0",
//"business_time": [
//[
//"9:00",
//"10:15"
//],
//[
//"10:30",
//"11:30"
//],
//[
//"13:30",
//"15:00"
//]
//],
//"sell_time": [
//"14:58",
//"14:58"
//],
//"holdings": 0,
//"rise_price": 0,
//"rise_num": 0,
//"down_price": 0,
//"down_num": 0,
//"rate": "1",
//"on_trade": 0,
//"is_self": 0
//},
//]
//}
