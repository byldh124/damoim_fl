import 'package:damoim/config/style/color.dart';
import 'package:damoim/config/style/font.dart';
import 'package:damoim/core/route/routes.dart';
import 'package:damoim/features/common/model/request/version_params.dart';
import 'package:damoim/features/common/repository/common_repository.dart';
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
  void _checkAppVersion() async {
    final repository = ref.watch(commonRepositoryProvider);
    final response = await repository.checkAppVersion(VersionParams(
        versionCode: 23, versionName: '1.2.12', packageName: 'com.moondroid.wordcomplete'));

    debugPrint('Response : $response');
    if (response.code == 1000) {
      _checkUserId();
    } else {
      _showAlert();
    }
  }

  void _checkUserId() {
    context.go('/login');
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
    _checkAppVersion();
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
