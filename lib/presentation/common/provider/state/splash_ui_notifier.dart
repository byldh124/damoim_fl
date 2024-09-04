import 'package:damoim/domain/model/request/version_params.dart';
import 'package:damoim/domain/repository/app_repository.dart';
import 'package:damoim/presentation/common/provider/state/spalsh_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashUiNotifier extends StateNotifier<SplashUiState> {
  final AppRepository repository;

  SplashUiNotifier({required this.repository}) : super(SplashUiState.loading);

  /// api response의 결과로 화면을 변경하는게 아닌 팝업이나 다른 이벤트를 발생해야 하는 경우
  /// 1. initState => ref.listenManual() 함수 사용
  /// 2. FutureProvider 사용 (1순위)

  Future<void> checkAppVersion(VersionParams params) async {
    final response = await repository.checkAppVersion(params);
    if (response.code == 1000) {
      state = SplashUiState.sign;
    } else if (response.code == 2001) {
      state = SplashUiState.update;
    }
  }
}
