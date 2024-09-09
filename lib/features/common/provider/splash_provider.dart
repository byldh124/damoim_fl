import 'package:damoim/core/di/injector.dart';
import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/domain/usecase/app_version_use_case.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:damoim/features/common/provider/state/splash_ui_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashUiNotifier, SplashUiState>((ref) {
  final useCase = injector.get<AppVersionUseCase>();
  return SplashUiNotifier(useCase: useCase);
});

/// api response의 결과로 화면을 변경하는게 아닌 팝업이나 다른 이벤트를 발생해야 하는 경우
/// 1. initState => ref.listenManual() 함수 사용
/// 2. FutureProvider 사용 (1순위)
final checkAppVersionProvider =
    FutureProvider.family.autoDispose<BaseResponse, VersionParams>((ref, params) async {
  final useCase = injector.get<AppVersionUseCase>();
  return await useCase.execute(params);
});
