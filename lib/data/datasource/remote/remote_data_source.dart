import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/dio/dio.dart';
import 'package:damoim/domain/model/response/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source_impl.dart';
import 'package:damoim/data/model/dto/group_item_dto.dart';
import 'package:damoim/data/model/dto/user_profile_dto.dart';
import 'package:damoim/domain/model/request/version_params.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteDatasourceProvider = Provider<RemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return RemoteDataSourceImpl(dio: dio);
});

abstract class RemoteDataSource {
  Future<BaseResponse> checkAppVersion(VersionParams params);
  Future<BaseResponse<UserProfileDto>> sign(String id, String pw);
  Future<BaseResponse<List<GroupItemDto>>> getGroupList(String id, GroupType type);
}
