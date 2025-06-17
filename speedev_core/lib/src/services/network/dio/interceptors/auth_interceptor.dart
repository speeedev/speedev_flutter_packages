import 'package:dio/dio.dart';
import 'package:speedev_core/src/helpers/storage/local_storage_helper.dart';

class SDAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SDLocalStorageHelper().getValue<String>('token');
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
