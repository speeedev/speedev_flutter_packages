import 'package:dio/dio.dart';
import 'package:speedev_core/src/helpers/storage/local_storage_helper.dart';

class SDAuthInterceptor extends Interceptor {
  final String localStorageTokenKey;

  SDAuthInterceptor({required this.localStorageTokenKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = SDLocalStorageHelper().getValue<String>(localStorageTokenKey);
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
