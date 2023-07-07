import 'package:dio/dio.dart';

class CustomerInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.path =
        '${options.path}?api_key=583356f0c5a931197681532b0fafe0599b7dca35&format=json';
    super.onRequest(options, handler);
    return;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
