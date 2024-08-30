import 'dart:convert';

import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio();
  dio.options = BaseOptions(baseUrl: BASE_URL);
  dio.interceptors.add(
    CustomInterceptor(storage: storage),
  );
  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  // 1) 요청을 보낼 때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('[REQ] [${options.method}] => ${options.uri}');
    super.onRequest(options, handler);
  }

  // 2) 응답을 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '[RES] [${response.requestOptions.method}] <= ${response.statusCode} ${response.statusMessage} ${response.requestOptions.uri}');
    if (response.headers['content-type'].toString().contains('text/plain')) {
      response.data = jsonDecode(response.data as String);
    }
    debugPrint('[RES] ${response.data}');
    super.onResponse(response, handler);
  }

  // 3) 에러가 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('[ERROR] [${err.requestOptions.method}] ${err.requestOptions.uri}');
    debugPrint('[ERROR] ${err.message} , ${err.type}');
    super.onError(err, handler);
  }
}
