// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionParams _$VersionParamsFromJson(Map<String, dynamic> json) =>
    VersionParams(
      versionCode: (json['versionCode'] as num).toInt(),
      versionName: json['versionName'] as String,
      packageName: json['packageName'] as String,
    );

Map<String, dynamic> _$VersionParamsToJson(VersionParams instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
      'versionName': instance.versionName,
      'packageName': instance.packageName,
    };
