import 'package:damoim/core/domain/model/entity/user_profile_model.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';

abstract class UserRepository {
  Future<BaseResponse<UserProfileModel>> sign(String id, String pw);
}
