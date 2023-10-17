import 'dart:io';

import 'package:dio/dio.dart';

Dio xDio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 3000),
      baseUrl: 'https://jsonplaceholder.typicode.com',
      responseType: ResponseType.json,
      contentType: ContentType.json.toString(),
    ),
  );
  dio.interceptors.add(CustomInterceptors());
  return dio;
}

class CustomResponse {
  dynamic data;
  String rc;
  int code;

  CustomResponse({
    this.data,
    required this.rc,
    required this.code,
  });
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var newOptions = options.copyWith(headers: {
      "Authorization": "Bearer token",
    });
    super.onRequest(newOptions, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var data = CustomResponse(
      rc: "00",
      data: response.data,
      code: 200,
    );
    response.data = data;
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}
