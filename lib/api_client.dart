import 'package:dio/dio.dart';

class ApiClient {
  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholderx.typicode.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    return dio;
  }
}
