import 'package:damoim/config/style/color.dart';
import 'package:damoim/config/style/font.dart';
import 'package:damoim/core/route/routes.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource_impl.dart';
import 'package:damoim/features/common/data/model/request/version_params.dart';
import 'package:damoim/features/common/data/repository/app_repository_impl.dart';
import 'package:damoim/features/common/domain/repository/app_repository.dart';
import 'package:damoim/features/common/provider/splash_provider.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(splashProvider, (pre, next) async {
      switch(next) {
        case SplashUiState.loading:
        case SplashUiState.home:
          _toHome();
        case SplashUiState.sign:
          _checkUserId();
        case SplashUiState.update:
          _showAlert();
      }
    });
    ref.read(splashProvider.notifier).checkAppVersion('com.moondroid.wordcomplete', 23, '1.2.12');
  }

  void _checkAppVersion() async {

  }

  void _checkUserId() {
    context.go('/login');
  }

  void _toHome() {
    context.go('/home');
  }

  void _showAlert() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: const Text('앱 버전이 존재하지 않음'),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('확인'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '모임대장',
              style: TextStyle(color: RED_01, fontFamily: DMFont.nanum_round_eb, fontSize: 50),
            ),
            Text(
              '취미 생활 공유 플랫폼',
              style: TextStyle(color: RED_01, fontFamily: DMFont.nanum_round_eb, fontSize: 20),
            )
          ],
        ),
      ),
    );
    ;
  }
}
