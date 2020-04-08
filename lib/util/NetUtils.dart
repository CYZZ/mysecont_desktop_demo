import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

//import 'package:flutterpluginafnet/flutterpluginafnet.dart';
import 'package:http/http.dart' as http;

class NetUtils {
  static Future<dynamic> get(String url, {Map<String, dynamic> params}) async {
//    if (Platform.isMacOS) {
//      Map result = await Flutterpluginafnet.startGetRequest(url);
//      print("获取到的mac数据result=$result");
//      return result["data"];
//    } else {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        url,
        queryParameters: params,
        options: Options(headers: getCommonHeader()),
      );

      print("url = $url");
      print("response.request.headers = ${response.request.headers}");

      return (response.data is Map)
          ? response.data
          : json.decode(response.data);
    } on DioError catch (error) {
      print('neUtils.dart-DioError = $error');
    }
//    }
  }

  /// post请求
  ///
  static Future<dynamic> post(String url, {Map<String, String> params}) async {
    Dio dio = Dio();
    Response response = await dio.post(
      url,
      queryParameters: params,
      options: Options(headers: getCommonHeader()),
    );
    return response.data;
  }

  static Map<String, String> getCommonHeader() {
    Map<String, String> header = Map();
    header['is_flutter_osc'] = "1";
    return header;
  }
}
