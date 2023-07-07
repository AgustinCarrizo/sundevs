import 'package:dio/dio.dart';
import 'package:sundevs/dio/conection.dart';
import 'package:sundevs/utils/variable_static.dart';

class CustomerInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var conection = await Conection().conectio();
    if (conection == true) {
      options.path  =  '${options.path}?api_key=583356f0c5a931197681532b0fafe0599b7dca35&format=json';
      super.onRequest(options, handler);
    } else {
      NavigationService().show('No tiene conecion a internet');
      handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
        error: 'No hay conexión a Internet.',
      ));
      return;
    }

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
