import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/data/repository/group_repository_impl.dart';
import 'package:damoim/core/domain/model/entity/group_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GroupRepository {
  Future<BaseResponse<List<GroupItemModel>>> getGroupList(String id, GroupType type);
}