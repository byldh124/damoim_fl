import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/data/datasource/remote/remote_data_source.dart';
import 'package:damoim/core/data/repository/user_repository_impl.dart';
import 'package:damoim/core/domain/model/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final remoteDataSource = ref.watch(remoteDatasourceProvider);
  return UserRepositoryImpl(remoteDataSource: remoteDataSource);   
});

abstract class UserRepository {
  Future<BaseResponse<UserProfileModel>> sign(String id, String pw);
}