import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/domain/model/entity/group_item_model.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';

abstract class GroupRepository {
  Future<BaseResponse<List<GroupItemModel>>> getGroupList(String id, GroupType type);
}