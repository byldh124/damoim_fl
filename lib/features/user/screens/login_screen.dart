import 'package:damoim/config/component/custom_text_form_field.dart';
import 'package:damoim/config/component/default_layout.dart';
import 'package:damoim/config/style/color.dart';
import 'package:damoim/config/style/font.dart';
import 'package:damoim/core/utils/alert_util.dart';
import 'package:damoim/features/user/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with AlertUtil {
  String id = "";
  String pw = "";

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '로그인',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '모임대장에서 다양한 사람들과 이야기를 나눠보세요',
              style: TextStyle(fontSize: 16, fontFamily: DMFont.nanum_round_r, color: GRAY_01),
            ),
            Expanded(
              child: Image.asset('assets/images/image_login.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '모임대장의 회원이신가요?',
              style: TextStyle(fontFamily: DMFont.nanum_round_r, fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              onChanged: (text) {
                id = text;
              },
              hintText: '아이디를 입력해주세요.',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              onChanged: (text) {
                pw = text;
              },
              hintText: '비밀번호를 입력해주세요.',
              obscureText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                _sign();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(RED_02),
                overlayColor: WidgetStateProperty.all(RED_03),
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                    color: Colors.white, fontFamily: DMFont.cafe24_surround, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  context.go('/login/signup');
                },
                child: RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 16, fontFamily: DMFont.nanum_round_b, color: GRAY_01),
                        children: [
                      TextSpan(text: '아직 회원이 아니시라면 '),
                      TextSpan(text: "'여기'", style: TextStyle(color: RED_01)),
                      TextSpan(text: '를 클릭해주세요.'),
                    ])),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              '이 어플은 실제 서비스 되는 앱이 아닌 개인용 프로젝트 입니다.',
              style: TextStyle(color: GRAY_01),
            )
          ],
        ),
      ),
    );
  }

  void _sign() async {
    final response = await ref.read(loginProvider((id: id, pw: pw)).future);
    if (!mounted) return;
    if (response.success()) {
      context.go('/home');
    } else {
      alert(context: context, title: '로그인 실패', message: response.message);
    }
  }
}
