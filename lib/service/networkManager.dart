import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager? manager;

  NetworkManager._() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
    ));
  }
  late Dio _dio;
  Dio get getDio => _dio;

  static NetworkManager instance = NetworkManager._();

  
}
