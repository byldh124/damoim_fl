import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/dio/dio.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/features/common/model/request/version_params.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'common_repository.g.dart';

final commonRepositoryProvider = Provider<CommonRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return CommonRepository(dio, baseUrl: BASE_URL);
});

@RestApi()
abstract class CommonRepository {
  factory CommonRepository(Dio dio, {String baseUrl}) = _CommonRepository;

  @GET('/app/checkVersion.php')
  Future<SimpleResponse> checkAppVersion(@Queries() VersionParams versionParams);
}
