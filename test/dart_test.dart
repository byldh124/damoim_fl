import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:sprintf/sprintf.dart';

void main() {
  const salt = "60cb1ccf9c81f0e86b4f29d4b6b8c355";
  const inputPw = "asdf1234";
  const hashPw = "4c944163921c5705cad3fdd8d49d3ae994c3729ba524abdda64512ba3951a30c";

  var output = utf8.encode(inputPw);
  for (int i = 0; i < 1000; i++) {
    final temp = toHexString(output) + salt;
    final digest = sha256.convert(utf8.encode(temp));
    output = utf8.encode(digest.toString());
    debugPrint("digest[$i] : ${digest.toString()}");
    debugPrint("output[$i] : ${toHexString(output)}");
  }
}

String toHexString(Uint8List list) {
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < list.length; i++) {
    buffer.write(sprintf('%02x', [list[i]]));
  }
  return buffer.toString();
}
