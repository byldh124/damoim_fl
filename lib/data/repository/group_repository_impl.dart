import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/data/model/dto/group_item_dto.dart';
import 'package:damoim/domain/repository/group_repository.dart';

class GroupRepositoryImpl extends GroupRepository {
  RemoteDataSource remoteDataSource;

  GroupRepositoryImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<List<GroupItemDto>>> getGroupList(String id, GroupType type) {
    return remoteDataSource.getGroupList(id, type);
  }
}