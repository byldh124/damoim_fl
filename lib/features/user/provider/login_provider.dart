import 'package:damoim/core/data/repository/user_repository_impl.dart';
import 'package:damoim/core/domain/model/entity/user_profile_model.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    FutureProvider.family<BaseResponse<UserProfileModel>, ({String id, String pw})>((ref, params) async {
  final repository = ref.watch(userRepositoryProvider);
  return await repository.sign(params.id, params.pw);
});
