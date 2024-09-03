import 'package:flutter/cupertino.dart';

mixin AlertUtil {
  void alert(
      {required BuildContext context, String? title, String? message}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: Text(message ?? "알림"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                //callback?.call();
                Navigator.pop(context);
              },
              child: const Text('확인'),
            )
          ],
        );
      },
    );
  }
}
