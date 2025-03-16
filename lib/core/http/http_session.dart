
import 'package:apex_dmit/core/http/response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late Dio _dio;
  final _storage = FlutterSecureStorage();

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://devapi.propsoft.ai/api/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));
  }

  static ApiClient get instance => _instance;

  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
    setAuthToken(token);
  }

  Future<String?> loadToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
    clearAuthToken();
  }

  Future<DResponse> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return DResponse.fromResponse(await _dio.get(path, queryParameters: queryParameters));
    } on DioException catch (e) {
      return DResponse.fromResponse(e);
    }
  }

  Future<DResponse> post(String path, {dynamic data}) async {
    try {
      return DResponse.fromResponse(await _dio.post(path, data: data));
    } on DioException catch (e) {
      return DResponse.fromResponse(e);
    }
  }

}