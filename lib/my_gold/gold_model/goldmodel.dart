class GoldModel {
  int code;
  String msg;
  GoldData data;

  static GoldModel fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    GoldModel model = GoldModel();
    model.code = map['code'];
    model.msg = map['msg'];
    model.data = GoldData.fromMap(map['data']);
    return model;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {"code": code, "msg": msg, "data": data.toString()}.toString();
  }
}

class GoldData {
  double mostHigh;
  double mostLow;
  double close;
  double open;

  static GoldData fromMap(Map<dynamic, dynamic> map) {
    if (map == null) {
      Map dataMp = {"mostHigh": 0, "mostLow": 0, "open": 0, "close": 0};
      GoldData data = GoldData.fromMap(dataMp);
      return data;
    }
    GoldData data = GoldData();
    data.mostHigh = map['mostHigh'] ?? 0; // 设置默认值为0，防止在计算的时候null参与
    data.mostLow = map['mostLow'] ?? 0;
    data.open = map['open'] ?? 0;
    data.close = map['close'] ?? 0;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {
      "mostHigh": mostHigh,
      "mostLow": mostLow,
      "open": open,
      "close": close
    }.toString();
  }
}

//{
//"code": 10000,
//"msg": "请求成功",
//"data": {
//"mostHigh": 17.25,
//"mostLow": 17.1,
//"close": 17.2,
//"open": 17.2
//}
//}
