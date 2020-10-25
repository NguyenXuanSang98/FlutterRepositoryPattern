import 'package:dio/dio.dart';

class ApiInstance {
  static Dio _instance;
  static Dio getInstance() {
    if (_instance == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: "https://api.themoviedb.org/3",
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );
      _instance = new Dio(options);
    }
    return _instance;
  }
}
