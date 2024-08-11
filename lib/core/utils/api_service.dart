import 'package:dio/dio.dart';
import 'package:payment/core/utils/api_interceptors.dart';
import 'package:payment/core/utils/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    // إضافة المراقب (Interceptor) عند تهيئة ApiService
    addDioInterceptor();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = EndPoint.baseUrl;
  }

  Map<String, String> _buildHeaders(String token,
      [Map<String, String>? additionalHeaders]) {
    final baseHeaders = {'Authorization': 'Bearer $token'};
    if (additionalHeaders != null) {
      return {...baseHeaders, ...additionalHeaders};
    }
    return baseHeaders;
  }

  Future<Response> get({
    required String url,
    required String token,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.get(
        url,
        options: Options(
          headers: _buildHeaders(token, headers),
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

  Future<Response> post({
    required dynamic body,
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: _buildHeaders(token, headers),
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  Future<Response> delete({
    required String url,
    required String token,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.delete(
        url,
        options: Options(
          headers: _buildHeaders(token, headers),
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }

  Future<Response> patch({
    required dynamic body,
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
  }) async {
    try {
      var response = await dio.patch(
        url,
        data: body,
        options: Options(
          contentType: contentType ?? 'application/json',
          headers: _buildHeaders(token, headers),
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Failed to patch data: $e');
    }
  }

  /// Add PrettyDioLogger interceptor for debugging
  void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
