import 'package:damoim/core/const/data.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/domain/model/entity/group_item_model.dart';
import 'package:damoim/core/domain/repository/group_repository.dart';

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
