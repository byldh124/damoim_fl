import 'package:damoim/core/di/injector.dart';
import 'package:damoim/core/domain/model/entity/user_profile_model.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';
import 'package:damoim/core/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    FutureProvider.family.autoDispose<BaseResponse<UserProfileModel>, ({String id, String pw})>((ref, params) async {
  final repository = injector.get<UserRepository>();
  return await repository.sign(params.id, params.pw);
});
