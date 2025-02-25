//https://api.aladhan.com/v1/timingsByCity/25-02-2025?city=Cairo&country=Egypt&method=2
import 'package:dio/dio.dart';

class ParytimeAPI {
  final Dio _dio = Dio();

  Future<Response> getPraytime({
    required String date,
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
        'https://api.aladhan.com/v1/timings/$date?latitude=$latitude&longitude=$longitude&method=2');
    final response = await _dio.get(url.toString());
    return response;
  }
}
