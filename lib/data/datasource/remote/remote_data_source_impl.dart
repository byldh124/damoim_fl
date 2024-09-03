import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/core/utils/string_util.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/model/dto/group_item_dto.dart';
import 'package:damoim/data/model/dto/user_profile_dto.dart';
import 'package:damoim/data/model/request/salt_request_params.dart';
import 'package:damoim/data/model/request/sign_request_params.dart';
import 'package:damoim/data/model/request/version_params.dart';
import 'package:dio/dio.dart';

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

  @override
  Future<BaseResponse<List<GroupItemDto>>> getGroupList(String id, GroupType type) async {
    final Response response;
    switch (type) {
      case GroupType.ALL:
        response = await dio.get('/group/group.php');
      case GroupType.FAVORITE:
        response = await dio.get('/group/favorite.php');
      case GroupType.RECENT:
        response = await dio.get('/group/recent.php');
      case GroupType.MYGROUP:
        response = await dio.get('/group/myGroup.php');
    }

    return BaseResponse.fromJson(
      response.data!,
      (json) {
        final list = json as List<dynamic>;
        final groupList = list.map((e) {
          final map = e as Map<String, dynamic>;
          return GroupItemDto.fromJson(map);
        }).toList();
        return List.empty();
      },
    );
  }
}
