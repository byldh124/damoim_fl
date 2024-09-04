import 'package:damoim/domain/model/request/version_params.dart';
import 'package:damoim/domain/model/response/base_response.dart';
import 'package:damoim/domain/repository/app_repository.dart';
import 'package:damoim/presentation/common/provider/state/spalsh_ui_state.dart';
import 'package:damoim/presentation/common/provider/state/splash_ui_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashUiNotifier, SplashUiState>((ref) {
  final repository = ref.watch(appRepositoryProvider);
  return SplashUiNotifier(repository: repository);
});

/// api response의 결과로 화면을 변경하는게 아닌 팝업이나 다른 이벤트를 발생해야 하는 경우
/// 1. initState => ref.listenManual() 함수 사용
/// 2. FutureProvider 사용 (1순위)
final checkAppVersionProvider = FutureProvider.family<BaseResponse,VersionParams>((ref, params) async {
  final repository = ref.watch(appRepositoryProvider);
  return await repository.checkAppVersion(params);
});
