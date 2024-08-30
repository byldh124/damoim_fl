import 'package:damoim/config/const/data.dart';
import 'package:damoim/core/model/simple_response.dart';
import 'package:damoim/features/common/data/datasource/remote/app_remote_datasource.dart';
import 'package:damoim/features/common/data/model/request/version_params.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class AppRemoteDatasourceImpl extends AppRemoteDatasource {
  final Dio dio;

  AppRemoteDatasourceImpl({required this.dio});

  @override
  Future<SimpleResponse> checkAppVersion(String packageName, int versionCode, String versionName) async {
    final versionParams = VersionParams(versionCode: versionCode, versionName: versionName, packageName: packageName);
    final response = await dio.get("/app/checkVersion.php", queryParameters: versionParams.toJson());
    debugPrint("response : $response");
    return SimpleResponse.fromJson(response.data);
  }
}