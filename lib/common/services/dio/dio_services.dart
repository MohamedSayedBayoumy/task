import 'package:dio/dio.dart';

abstract class DioServices {
  static final Dio dio = Dio();

  static Future<Response> post(
      {String? url, FormData? body, String? token, String? contentType}) async {
    final response = await dio.post(url!,
        data: body,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }));
    return response;
  }
}
