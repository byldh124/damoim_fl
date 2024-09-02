import 'dart:typed_data';

import 'package:sprintf/sprintf.dart';

class StringUtil {
  static String toHexString(Uint8List list) {
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < list.length; i++) {
      buffer.write(sprintf('%02x', [list[i]]));
    }
    return buffer.toString();
  }
}