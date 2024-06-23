import 'package:catbreeds/envs.dart';
import 'package:dio/dio.dart';

abstract class Api {
  static final Dio dio = Dio(BaseOptions(baseUrl: Envs.apiUrl, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'x-api-key': Envs.apiKey,
  }));

  Future<T?> apiGet<T>(String path, Map<String, dynamic>? params) async {
    try {
      final response = await dio.get<T>(path, queryParameters: params);
      print(response.realUri);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<T?> apiPost<T, K>(String path, K? body) async {
    try {
      final response = await dio.post<T>(path, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<T?> apiPut<T, K>(String path, K? body) async {
    try {
      final response = await dio.put<T>(path, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<T?> apiDelete<T>(String path, Map<String, dynamic>? params) async {
    try {
      final response = await dio.delete<T>(path, queryParameters: params);
      return response.data;
    } catch (_) {
      return null;
    }
  }
}
