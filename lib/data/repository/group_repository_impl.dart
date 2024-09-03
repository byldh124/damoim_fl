import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/domain/model/group_item_model.dart';
import 'package:damoim/domain/repository/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  RemoteDataSource remoteDataSource;

  GroupRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<List<GroupItemModel>>> getGroupList(String id, GroupType type) async {
    final response = await remoteDataSource.getGroupList(id, type);
    final result = response.copyWith((list) {
      return list?.map((e) => e.toDomainModel()).toList();
    });
    return result;
  }
}
