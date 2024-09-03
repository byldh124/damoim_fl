import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/repository/group_repository_impl.dart';
import 'package:damoim/domain/model/group_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final groupRepositoryProvider = Provider<GroupRepository>((ref) {
  final remoteDataSource = ref.watch(remoteDatasourceProvider);
  return GroupRepositoryImpl(remoteDataSource: remoteDataSource);
});

abstract class GroupRepository {
  Future<BaseResponse<List<GroupItemModel>>> getGroupList(String id, GroupType type);
}