import 'package:json_annotation/json_annotation.dart';

part 'version_params.g.dart';

@JsonSerializable()
class VersionParams {
  final int versionCode;
  final String versionName;
  final String packageName;

  const VersionParams({
    required this.versionCode,
    required this.versionName,
    required this.packageName,
  });

  factory VersionParams.fromJson(Map<String, dynamic> json) =>
      _$VersionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionParamsToJson(this);
}
