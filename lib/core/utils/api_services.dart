// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final _baseUrl = 'https://iot-platform.onrender.com/api/';
  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Response> get({required String endPoint}) async {
    final response = await _dio.get("$_baseUrl$endPoint");
    if (kDebugMode) {
      print(response.data);
    }
    return response.data;
  }

  Future<Response> post(
      {required Object? data, required String endPoint}) async {
    final response = await _dio.post(
      "$_baseUrl$endPoint",
      queryParameters: {"Content-Type": "application/json"},
      data: data,
    );
    if (kDebugMode) {
      // print(response.data);
    }
    return response.data;
  }
}
