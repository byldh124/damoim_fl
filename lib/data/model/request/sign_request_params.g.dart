// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignRequestParams _$SignRequestParamsFromJson(Map<String, dynamic> json) =>
    SignRequestParams(
      json['id'] as String,
      json['hashPw'] as String,
    );

Map<String, dynamic> _$SignRequestParamsToJson(SignRequestParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hashPw': instance.hashPw,
    };
