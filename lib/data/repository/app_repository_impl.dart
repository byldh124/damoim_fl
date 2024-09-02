import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/model/request/version_params.dart';
import 'package:damoim/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final RemoteDataSource datasource;
  AppRepositoryImpl({required this.datasource});

  @override
  Future<SimpleResponse> checkAppVersion(VersionParams params) {
    return datasource.checkAppVersion(params);
  }
}