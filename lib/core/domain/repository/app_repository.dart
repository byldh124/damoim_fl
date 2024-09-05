import 'package:damoim/core/domain/model/request/version_params.dart';
import 'package:damoim/core/domain/model/response/base_response.dart';

abstract class AppRepository {
  Future<BaseResponse> checkAppVersion(VersionParams params);
}
