import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/core/utils/string_util.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/model/dto/user_profile_dto.dart';
import 'package:damoim/data/model/request/salt_request_params.dart';
import 'package:damoim/data/model/request/sign_request_params.dart';
import 'package:damoim/data/model/request/version_params.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:sprintf/sprintf.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<SimpleResponse> checkAppVersion(VersionParams params) async {
    final response = await dio.get("/app/checkVersion.php", queryParameters: params.toJson());
    return SimpleResponse.fromJson(response.data);
  }

  @override
  Future<BaseResponse<UserProfileDto>> sign(String id, String pw) async {
    final saltResult = await dio.post('/sign/salt.php', data: SaltRequestParams(id).toJson());
    final saltResponse = SimpleResponse.fromJson(saltResult.data!);

    final salt = saltResponse.result ?? "";
    var output = StringUtil.toHexString(utf8.encode(pw));
    for (int i = 0; i < 1000; i++) {
      output = output + salt;
      final digest = sha256.convert(utf8.encode(output));
      output = digest.toString();
    }

    final hashPw = output;

    final signResult =
        await dio.post('/sign/signIn.php', data: SignRequestParams(id, hashPw).toJson());

    return BaseResponse<UserProfileDto>.fromJson(
        signResult.data!, (json) => UserProfileDto.fromJson(json as Map<String, dynamic>));
  }
}
