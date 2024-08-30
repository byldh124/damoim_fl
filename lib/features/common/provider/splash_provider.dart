import 'package:damoim/features/common/domain/repository/app_repository.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:damoim/features/common/provider/state/splash_ui_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashUiNotifier, SplashUiState>((ref) {
  final repository = ref.watch(appRepositoryProvider);
  return SplashUiNotifier(repository: repository);
});