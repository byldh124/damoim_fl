import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource.dart';
import 'package:damoim/features/common/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final AppRemoteDatasource datasource;
  AppRepositoryImpl({required this.datasource});

  @override
  Future<SimpleResponse> checkAppVersion(String packageName, int versionCode, String versionName) {
    return datasource.checkAppVersion(packageName, versionCode, versionName);
  }
}