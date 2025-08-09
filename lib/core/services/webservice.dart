
import 'package:dio/dio.dart';
import 'dart:convert';

class WebService {
  static final WebService _instance = WebService._internal();
  factory WebService() => _instance;

  late Dio dio;

  WebService._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://fakerestaurantapi.runasp.net/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        print("❌ Dio Error: ${error.response?.data ?? error.message}");
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio.get(endpoint, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  static dynamic decodeResp(Response response) {
    try {
      return response.data;
    } catch (e) {
      print("Error decoding: $e");
      return [];
    }
  }




}


