import 'package:damoim/core/dio/dio.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource_impl.dart';
import 'package:damoim/features/common/data/repository/app_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRepositoryProvider = Provider((ref) {
  final datasource = ref.watch(appRemoteDatasourceProvider);
  return AppRepositoryImpl(datasource: datasource);
});

abstract class AppRepository {
  Future<SimpleResponse> checkAppVersion(String packageName, int versionCode, String versionName);
}
