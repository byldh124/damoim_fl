import 'package:damoim/config/component/custom_text_form_field.dart';
import 'package:damoim/config/component/default_layout.dart';
import 'package:damoim/config/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '회원가입',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('아이디를 입력해주세요.'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                onChanged: (s) {},
                hintText: '아이디를 입력해주세요.',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('비밀번호를 입력해주세요.'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                onChanged: (s) {},
                obscureText: true,
                hintText: '비밀번호를 입력해주세요.',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('비밀번호를 한번 더 입력해주세요.'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                onChanged: (s) {},
                obscureText: true,
                hintText: '비밀번호를 한번 더 입력해주세요.',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('이름을 입력해주세요.'),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                onChanged: (s) {},
                hintText: '이름을 입력해주세요.',
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('생년월일.'),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: GRAY_04)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(''),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
