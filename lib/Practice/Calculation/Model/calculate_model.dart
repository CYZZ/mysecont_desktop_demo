class CalculateHistory {
  double firstNum;
  double secondNum;
  double resultNum;
  bool isTrue;
  String consumeTime;
  String startTime;

  CalculateHistory(
    this.firstNum,
    this.secondNum,
    this.resultNum,
    this.isTrue,
    this.consumeTime,
    this.startTime,
  );

// static CalculateHistory fromMap(Map<dynamic, dynamic> map) {
//   if (map == null) return null;
//   CalculateHistory model = CalculateHistory();
//   model.code = map['code'];
//   model.msg = map['msg'];
//   List dataList = map["data"];
//   return model;
// }
}
