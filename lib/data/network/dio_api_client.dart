import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioApiClient {
  // Singleton instance
  static final DioApiClient _instance = DioApiClient._internal();

  factory DioApiClient() {
    return _instance;
  }

  DioApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://v3.football.api-sports.io',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'x-apisports-key': dotenv.env['API_FOOTBALL_KEY'],
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        preserveHeaderCase: false,
        responseType: ResponseType.json,
        contentType: 'application/json',
        validateStatus: (status) {
          return status != null && status >= 200 && status < 400;
        },
        receiveDataWhenStatusError: true,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          _dioErrorHandler(error);
          return handler.next(error);
        },
      ),
    );
  }

  void _dioErrorHandler(DioException error) {
    // Custom error handling, bisa disesuaikan
    print('Dio Error: ${error.message}');
    // Bisa diganti jadi throw atau log error
  }

  late final Dio _dio;
  Dio get dio => _dio;
}
