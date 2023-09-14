import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'interceptor_dio_back4app.dart';

class CustomDioBack4App {
  final _dio = Dio();

  CustomDioBack4App() {
    _dio.options.baseUrl = dotenv.get("BASE_URL");
    _dio.interceptors.add(InterceptorDioBackforapp());
  }

  Dio get dio => _dio;
}
