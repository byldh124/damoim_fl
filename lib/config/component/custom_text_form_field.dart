import 'package:damoim/config/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final String? initialValue;
  final bool digitText;
  final int? maxLength;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    this.maxLength,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autoFocus = false,
    this.digitText = false,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    // UnderlineInputBorder - 기본 적용
    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
      color: GRAY_06,
      width: 1.0,
    ));

    return TextFormField(
        cursorColor: RED_02,
        //비밀번호 입력할때
        obscureText: obscureText,
        initialValue: initialValue,
        maxLength: maxLength,
        //화면진입시 자동 포커스상태
        autofocus: autoFocus,
        //값이 바뀔때
        inputFormatters: digitText ? [FilteringTextInputFormatter.digitsOnly] : null,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 25),
          hintText: hintText,
          hintStyle: TextStyle(
            color: GRAY_06,
            fontSize: 14.0,
          ),
          errorText: errorText,
          fillColor: Colors.white,
          //filled : false - 배경색 없음
          //filled : true - 배경색 있음
          filled: true,

          // 모든 Input 상태의 기본 스타일 세팅
          border: baseBorder,
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: RED_02,
            ),
          ),
        ));
  }
}
