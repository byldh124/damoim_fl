import 'package:damoim/core/domain/model/entity/user_profile_model.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<BaseResponse<UserProfileModel>> sign(String id, String pw) async {
    final response = await remoteDataSource.sign(id, pw);
    return response.copyWith<UserProfileModel>((dto) => dto?.toDomainModel());
  }
}
