import 'package:dio/dio.dart';
import 'package:speedev_core/src/services/network/dio/dio_config.dart';

abstract class SDNetworkServiceAbstract {
  SDNetworkServiceAbstract() : dioConfig = SDDioConfig();
  final SDDioConfig dioConfig;

  Future<T?> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
  Future<T?> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });
  Future<T?> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });
  Future<T?> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
  Future<void> download({
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
  Future<T?> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final response = await getDio().get(path, queryParameters: queryParameters, data: data);
    return response.data as T?;
  }

  @override
  Future<T?> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final response = await getDio().post(path, queryParameters: queryParameters, data: data);
    return response.data as T?;
  }

  @override
  Future<T?> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final response = await getDio().put(path, queryParameters: queryParameters, data: data);
    return response.data as T?;
  }

  @override
  Future<T?> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await getDio().delete(path, queryParameters: queryParameters);
    return response.data as T?;
  }

  @override
  Future<void> download({
    required String savePath,
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    await getDio().download(path, savePath, queryParameters: queryParameters);
  }
}
