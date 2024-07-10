import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(
    this.dio,
  );

  Future<Response> get({required String endPoint}) async {
    var response = await dio.get(endPoint);
    return response;
  }
}
