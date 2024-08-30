import 'package:damoim/features/common/domain/repository/app_repository.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashUiNotifier extends StateNotifier<SplashUiState> {
  final AppRepository repository;
  SplashUiNotifier({required this.repository}): super(SplashUiState.loading);

  Future<void> checkAppVersion(String packageName, int versionCode, String versionName) async {
    final response = await repository.checkAppVersion(packageName, versionCode, versionName);
    if (response.code == 1000) {
      state = SplashUiState.sign;
    } else if (response.code == 2001) {
      state = SplashUiState.update;
    }
  }
}