import 'package:damoim/domain/model/response/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/domain/model/request/version_params.dart';
import 'package:damoim/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final RemoteDataSource remoteDataSource;

  AppRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse> checkAppVersion(VersionParams params) {
    return remoteDataSource.checkAppVersion(params);
  }
}
