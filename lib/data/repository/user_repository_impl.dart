import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/domain/model/user_profile_model.dart';
import 'package:damoim/domain/repository/user_repository.dart';

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
