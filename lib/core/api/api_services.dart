import 'package:dio/dio.dart';

abstract class ApiServices {
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String? token,
  });

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String token,
    required Map<String, dynamic> data,
  });
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String token,
    Map<String, dynamic> data,
  });
}
