import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/usecase/app_version_use_case.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashUiNotifier extends StateNotifier<SplashUiState> {
  final AppVersionUseCase useCase;

  SplashUiNotifier({required this.useCase}) : super(SplashUiState.loading);

  /// api response의 결과로 화면을 변경하는게 아닌 팝업이나 다른 이벤트를 발생해야 하는 경우
  /// 1. initState => ref.listenManual() 함수 사용
  /// 2. FutureProvider 사용 (1순위)

  Future<void> checkAppVersion(VersionParams params) async {
    final response = await useCase.execute(params);
    if (response.code == 1000) {
      state = SplashUiState.sign;
    } else if (response.code == 2001) {
      state = SplashUiState.update;
    }
  }
}
