import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/data/repository/group_repository_impl.dart';
import 'package:damoim/core/domain/model/group_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  final remoteDataSource = ref.watch(remoteDatasourceProvider);
  return GroupRepositoryImpl(remoteDataSource: remoteDataSource);
});

abstract class GroupRepository {
  Future<BaseResponse<List<GroupItemModel>>> getGroupList(String id, GroupType type);
}