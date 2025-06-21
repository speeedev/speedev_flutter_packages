import 'package:dio/dio.dart';
import 'package:speedev_core/src/services/network/dio/interceptors/auth_interceptor.dart';
import 'package:speedev_core/src/services/network/dio/interceptors/log_interceptor.dart';

class SDDioConfig {
  static final SDDioConfig _instance = SDDioConfig._();
  factory SDDioConfig() => _instance;

  late final Dio _dio;
  Dio get dio => _dio;

  SDDioConfig._();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> init({
    required String baseUrl,
    Duration timeout = const Duration(seconds: 30),
    bool enableLogging = true,
    bool enableTokenAuth = false,
    String localStorageTokenKey = 'token',
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    List<Interceptor>? additionalInterceptors,
  }) async {
    if (_isInitialized) {
      throw StateError('SDDioConfig is already initialized');
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
        headers: headers,
        queryParameters: queryParameters,
        validateStatus: (status) => status! < 500,
      ),
    );

    if (enableLogging) {
      _dio.interceptors.add(SDLogInterceptor());
    }

    if (enableTokenAuth) {
      _dio.interceptors.add(SDAuthInterceptor(localStorageTokenKey: localStorageTokenKey));
    }

    if (additionalInterceptors != null) {
      _dio.interceptors.addAll(additionalInterceptors);
    }

    _isInitialized = true;
  }

  void updateBaseUrl(String baseUrl) {
    _checkInitialization();
    _dio.options.baseUrl = baseUrl;
  }

  void updateTimeout(Duration timeout) {
    _checkInitialization();
    _dio.options.connectTimeout = timeout;
    _dio.options.receiveTimeout = timeout;
    _dio.options.sendTimeout = timeout;
  }

  void addInterceptor(Interceptor interceptor) {
    _checkInitialization();
    _dio.interceptors.add(interceptor);
  }

  void updateHeaders(Map<String, String> headers) {
    _checkInitialization();
    _dio.options.headers.addAll(headers);
  }

  void _checkInitialization() {
    if (!_isInitialized) {
      throw StateError('SDDioConfig must be initialized before use. Call SDDioConfig().init() first.');
    }
  }
}
