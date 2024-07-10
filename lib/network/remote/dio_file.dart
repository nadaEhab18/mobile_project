import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelperStore {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    );
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token ?? '',
    };
    return await dio.get(url, queryParameters: query, data: data);
  }




  static Future<Response?> postData({required String url, Map<String, dynamic>? query, required Map<String, dynamic> data,}) async {
    log(data.toString());
    log("URL IS: ${url.toString()}");

     var response =  await dio.post(
       url,
       queryParameters: query,
       options: Options(
         headers: {
           'Content-Type': 'application/json',
           'lang': 'en',
         },
       ),
       data: data,
     );
       return response;

  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> delData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.delete(url, data: data);
  }
}
