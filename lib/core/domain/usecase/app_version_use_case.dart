import 'package:damoim/core/data/repository/app_repository_impl.dart';
import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/domain/repository/app_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appVersionUseCaseProvider = Provider<AppVersionUseCase>((ref) {
  final repo = ref.watch(appRepositoryProvider);
  return AppVersionUseCase(repo);
});


class AppVersionUseCase {
  final AppRepository _appRepository;
  const AppVersionUseCase(this._appRepository);

  Future<BaseResponse> execute(VersionParams params) => _appRepository.checkAppVersion(params);
}