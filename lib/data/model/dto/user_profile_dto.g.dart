// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      id: json['id'] as String,
      name: json['name'] as String,
      birth: json['birth'] as String,
      gender: json['gender'] as String,
      location: json['location'] as String,
      interest: json['interest'] as String,
      thumb: json['thumb'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birth': instance.birth,
      'gender': instance.gender,
      'location': instance.location,
      'interest': instance.interest,
      'thumb': instance.thumb,
      'message': instance.message,
    };
