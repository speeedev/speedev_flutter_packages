import 'package:dio/dio.dart';
import 'package:speedev_core/src/services/network/dio/dio_config.dart';

abstract class SDNetworkServiceAbstract {
  SDNetworkServiceAbstract() : dioConfig = SDDioConfig();
  final SDDioConfig dioConfig;

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<Response<T>> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<Response<T>> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> download({
    required String savePath,
    required String path,
    Map<String, dynamic>? queryParameters,
  });
}

class SDNetworkService implements SDNetworkServiceAbstract {
  SDNetworkService() : dioConfig = SDDioConfig();

  @override
  final SDDioConfig dioConfig;

  Dio getDio() => dioConfig.dio;

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await getDio().get<T>(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await getDio().post<T>(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    return await getDio().put<T>(path, queryParameters: queryParameters, data: data);
  }

  @override
  Future<Response<T>> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await getDio().delete<T>(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> download({
    required String savePath,
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await getDio().download(path, savePath, queryParameters: queryParameters);
  }
}
