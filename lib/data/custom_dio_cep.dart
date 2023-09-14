import 'package:dio/dio.dart';

class CustomDioCep {
  final _dio = Dio();

  CustomDioCep() {
    _dio.options.baseUrl = "https://viacep.com.br/ws";
  }

  Dio get dio => _dio;
}
