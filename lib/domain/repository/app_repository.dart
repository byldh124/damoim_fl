import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/model/request/version_params.dart';
import 'package:damoim/data/repository/app_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRepositoryProvider = Provider((ref) {
  final datasource = ref.watch(remoteDatasourceProvider);
  return AppRepositoryImpl(datasource: datasource);
});

abstract class AppRepository {
  Future<SimpleResponse> checkAppVersion(VersionParams params);
}
