import '../../util/NetUtils.dart';
import 'business_model.dart';

typedef DataCallBack = void Function(BusinessModel);

class BusinessNetwork {
  static getGoldValue(DataCallBack callBack) {
    NetUtils.get(
        'https://www.ty168.xyz/api/business/getList?type=0&sim=0')
        .then((data) {
      BusinessModel model = BusinessModel.fromMap(data);

      callBack(model);
    });
  }
}


// 常用地址：(get请求)
//1.https://www.ty168.xyz/api/business/getList?type=1&sim=0
//2.https://www.ty168.xyz/api/business/getList?type=0&sim=0
//3.https://www.ty168.xyz/api/business/getList?type=2&sim=0