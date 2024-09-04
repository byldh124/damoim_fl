import 'package:json_annotation/json_annotation.dart';

part 'sign_request_params.g.dart';

@JsonSerializable()
class SignRequestParams {
  final String id;
  final String hashPw;

  SignRequestParams(this.id, this.hashPw);

  factory SignRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SignRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SignRequestParamsToJson(this);
}