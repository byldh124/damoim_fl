import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/data/model/dto/group_item_dto.dart';
import 'package:damoim/core/data/model/dto/user_profile_dto.dart';
import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';

abstract class RemoteDataSource {
  Future<BaseResponse> checkAppVersion(VersionParams params);

  Future<BaseResponse<UserProfileDto>> sign(String id, String pw);

  Future<BaseResponse<List<GroupItemDto>>> getGroupList(String id, GroupType type);
}
