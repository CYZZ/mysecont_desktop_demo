import '../../util/NetUtils.dart';
import 'goldmodel.dart';
import 'dart:io';

typedef GoldDataCallBack = void Function(GoldModel);

class GoldNetWork {
  static getGoldValue(GoldDataCallBack callBack) {
    NetUtils.get(
            'http://goldayapp.golday999.com/goldayapp/getPriceDataOfDay/LLG')
        .then((data) {
      GoldModel model = GoldModel.fromMap(data);

      callBack(model);
    });
  }
}
