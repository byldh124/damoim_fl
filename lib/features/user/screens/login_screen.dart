import 'package:damoim/config/component/custom_text_form_field.dart';
import 'package:damoim/config/component/default_layout.dart';
import 'package:damoim/config/style/color.dart';
import 'package:damoim/config/style/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String id = "";
  String pw = "";

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '로그인하기',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '모임대장에서 다양한 사람들과 이야기를 나눠보세요',
              style: TextStyle(fontSize: 16, fontFamily: DMFont.nanum_round_r, color: GRAY_01),
            ),
            Image.asset(
              'assets/images/image_login.png',
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '모임대장의 회원이신가요?',
              style: TextStyle(fontFamily: DMFont.nanum_round_r, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              onChanged: (text) {},
              hintText: '아이디를 입력해주세요.',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              onChanged: (text) {},
              hintText: '비밀번호를 입력해주세요.',
              obscureText: true,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '로그인',
                style: TextStyle(
                    color: Colors.white, fontFamily: DMFont.cafe24_surround, fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(RED_02),
                overlayColor: WidgetStateProperty.all(RED_03),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  context.go('/login/signup');
                },
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 16, fontFamily: DMFont.nanum_round_b, color: GRAY_01),
                        children: [
                      TextSpan(text: '아직 회원이 아니시라면 '),
                      TextSpan(text: "'여기'", style: TextStyle(color: RED_01)),
                      TextSpan(text: '를 클릭해주세요.'),
                    ])),
              ),
            ),
            Expanded(child: SizedBox()),
            Text(
              '이 어플은 실제 서비스 되는 앱이 아닌 개인용 프로젝트 입니다.',
              style: TextStyle(color: GRAY_01),
            )
          ],
        ),
      ),
    );
  }
}
