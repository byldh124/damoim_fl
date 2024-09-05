import 'package:damoim/application/config/style/color.dart';
import 'package:damoim/application/config/style/font.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout(
      {super.key, required this.child, this.backgroundColor, this.title, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: _renderAppBar(),
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? _renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: DMFont.nanum_round_eb,
            color: GRAY_01
          ),
        ),
      );
    }
  }
}
