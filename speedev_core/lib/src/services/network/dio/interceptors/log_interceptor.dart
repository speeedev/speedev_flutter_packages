import 'package:dio/dio.dart';
import 'package:speedev_core/src/helpers/logger/logger_helper.dart';

class SDLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    SDLoggerHelper().info('Request: ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    SDLoggerHelper().info('Response: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    SDLoggerHelper().error('Error: ${err.response?.data}');
    super.onError(err, handler);
  }
}
