import 'package:damoim/core/model/base_response.dart';
import 'package:damoim/domain/model/user_profile_model.dart';
import 'package:damoim/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    FutureProvider.family<BaseResponse<UserProfileModel>, ({String id, String pw})>((ref, params) async {
  final repository = ref.watch(userRepositoryProvider);
  return await repository.sign(params.id, params.pw);
});
