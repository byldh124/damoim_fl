import 'package:damoim/config/style/color.dart';
import 'package:damoim/config/style/font.dart';
import 'package:damoim/core/utils/alert_util.dart';
import 'package:damoim/data/model/request/version_params.dart';
import 'package:damoim/features/common/provider/splash_provider.dart';
import 'package:damoim/features/common/provider/state/spalsh_ui_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 로그인 화면
/// 앱 버전 확인 - 유저 데이터 확인
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with AlertUtil {
  @override
  void initState() {
    super.initState();
    _checkAppVersion();
  }

  /// 기존에는 listenManual을 사용했지만 현재는 FutureProvider를 사용
  void _checkAppVersionLegacy() {
    const versionParams = VersionParams(
      versionCode: 30,
      versionName: '2.1.1',
      packageName: 'com.moondroid.project01_meetingapp',
    );

    ref.listenManual(splashProvider, (pre, next) {
      switch (next) {
        case SplashUiState.loading:
        case SplashUiState.home:
          context.go('/home');
        case SplashUiState.sign:
          context.go('/login');
        case SplashUiState.update:
          alert(context: context, message: "업데이트가 필요합니다.");
      }
    });
    ref.read(splashProvider.notifier).checkAppVersion(versionParams);
  }

  void _checkAppVersion() async {
    //TODO VERSION CHECK PARAMS
    const versionParams = VersionParams(
      versionCode: 30,
      versionName: '2.1.1',
      packageName: 'com.moondroid.project01_meetingapp',
    );

    Future.delayed(const Duration(seconds: 1), () async {
      final response = await ref.read(checkAppVersionProvider(versionParams).future);
      if (!mounted) return;
      switch (response.code) {
        case 1000:
          //TODO CHECK USER AUTO LOGIN
          //context.go('/login');
          context.go('/home');
        case 2001:
          alert(context: context, message: "업데이트가 필요합니다.");
        case 2004:
          alert(context: context, message: "앱 버전이 존재하지 않습니다.");
        default:
          alert(context: context, message: response.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return const Scaffold(
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
