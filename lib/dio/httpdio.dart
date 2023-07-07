import 'package:dio/dio.dart';
import 'package:sundevs/dio/custominterceptors.dart';

class HttpDio {
  Dio dio;

  HttpDio._(String? url) : dio = _addInterceptors( url);

  static Dio _addInterceptors(String? url) {
    final dio = Dio();

    final options = BaseOptions(
      baseUrl: url ?? 'https://comicvine.gamespot.com/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 8),
    );

    dio.interceptors.add(CustomerInterceptors());
    dio.options = options;

    return dio;
  }

   static HttpDio? _instance;

  static HttpDio getInstance(String? url) {
    _instance ??= HttpDio._(url);
    return _instance!;
  }
}

