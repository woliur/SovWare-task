import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'toastutils.dart';

class HttpClient {
  static Future<dynamic> get(String url, dynamic parameters,
      {String token = ''}) async {
    try {
      Dio dio = await _dioClient(token);
      Response response = await dio.get(url, queryParameters: parameters);
      return _response(response);
    } on DioError {
      ToastUtils.showError('check internet connection');
    }
  }

  static Future<dynamic> post(String url, dynamic parameters, dynamic body,
      {String token = ''}) async {
    try {
      Dio dio = await _dioClient(token);
      Response response =
          await dio.post(url, queryParameters: parameters, data: body);
      return _response(response);
    } on DioError {
      ToastUtils.showError('check internet connection');
    }
  }

  static Future<dynamic> upload(String url, dynamic body,
      {String token = ''}) async {
    try {
      Dio dio = await _dioClient(token);
      Response response = await dio.post(
        url,
        data: FormData.fromMap(body),
      );
      return _response(response);
    } on DioError {
      ToastUtils.showError('check internet connection');
    }
  }

  static Future<Dio> _dioClient(String token) async {
    Dio dio = Dio(await _options(token));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (io.HttpClient client) {
      client.badCertificateCallback =
          (io.X509Certificate cert, String host, int port) => true;
    };
    return dio;
  }

  static Future<BaseOptions> _options(String token) async {
    return BaseOptions(
      connectTimeout: 50000,
      receiveTimeout: 50000,
      followRedirects: true,
      validateStatus: (status) {
        return status! < 500;
      },
      headers: {
        'Authorization': "Bearer " + token,
      },
    );
  }

  static dynamic _response(Response response) {
    dynamic responseJson;
    switch (response.statusCode) {
      case 200:
        responseJson = json.decode(response.toString());
        return responseJson;
      case 201:
        responseJson = json.decode(response.toString());
        return responseJson;
      case 412:
        responseJson = json.decode(response.toString());
        return responseJson;
      case 401:
        throw Exception(response.data["message"]);
      case 403:
        throw Exception(response.data["message"]);
      case 404:
        throw Exception(response.data["message"]);
      case 417:
        throw Exception(response.data["message"]);
      case 422:
        throw Exception(response.data["message"]);
      case 500:
        throw Exception('Server Error!');
      case 503:
        throw Exception('Server Error!');
      default:
        throw Exception('Unknown Error!');
    }
  }
}
