import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/domain/repository/app_repository.dart';

class AppVersionUseCase {
  final AppRepository _appRepository;
  const AppVersionUseCase(this._appRepository);

  Future<BaseResponse> execute(VersionParams params) => _appRepository.checkAppVersion(params);
}