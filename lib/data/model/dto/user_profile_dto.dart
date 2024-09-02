import 'package:damoim/domain/model/user_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  String id;
  String name;
  String birth;
  String gender;
  String location;
  String interest;
  String thumb;
  String message;

  UserProfileDto({
    required this.id,
    required this.name,
    required this.birth,
    required this.gender,
    required this.location,
    required this.interest,
    required this.thumb,
    required this.message,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) => _$UserProfileDtoFromJson(json);

  UserProfileModel toDomainModel() {
    return UserProfileModel(
      id: id,
      name: name,
      birth: birth,
      gender: gender,
      location: location,
      interest: interest,
      thumb: thumb,
      message: message,
    );
  }
}
