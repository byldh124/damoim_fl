import 'package:damoim/core/dio/dio.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRemoteDatasourceProvider = Provider<AppRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return AppRemoteDatasourceImpl(dio: dio);
});

abstract class AppRemoteDatasource {
  Future<SimpleResponse> checkAppVersion(String packageName, int versionCode, String versionName);
}
