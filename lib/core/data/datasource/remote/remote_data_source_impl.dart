import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:damoim/application/utils/string_util.dart';
import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/data/model/dto/group_item_dto.dart';
import 'package:damoim/core/data/model/dto/user_profile_dto.dart';
import 'package:damoim/core/domain/model/request/sign_request_params.dart';
import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<BaseResponse> checkAppVersion(VersionParams params) async {
    final response = await dio.get("/app/checkVersion.php", queryParameters: params.toJson());
    return BaseResponse.fromJson(response.data!, (j) {});
  }

  @override
  Future<BaseResponse<UserProfileDto>> sign(String id, String pw) async {
    final saltResult = await dio.post('/sign/salt.php', data: {'id': id});
    final saltResponse = BaseResponse<String>.fromJson(saltResult.data!, (json) => json.toString());

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
      signResult.data!,
      (json) => UserProfileDto.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<BaseResponse<List<GroupItemDto>>> getGroupList(String id, GroupType type) async {
    final Response response;
    switch (type) {
      case GroupType.ALL:
        response = await dio.get('/group/group.php');
      case GroupType.FAVORITE:
        response = await dio.get('/group/favorite.php', queryParameters: {'id': id});
      case GroupType.RECENT:
        response = await dio.get('/group/recent.php', queryParameters: {'id': id});
      case GroupType.MYGROUP:
        response = await dio.get('/group/myGroup.php', queryParameters: {'id': id});
    }

    return BaseResponse.fromJson(
      response.data!,
      (json) {
        final list = json as List<dynamic>;
        final groupList = list.map((e) {
          final map = e as Map<String, dynamic>;
          return GroupItemDto.fromJson(map);
        }).toList();
        return groupList;
      },
    );
  }
}
