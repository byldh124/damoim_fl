import 'package:json_annotation/json_annotation.dart';

part 'salt_request_params.g.dart';

@JsonSerializable()
class SaltRequestParams {
  final String id;

  SaltRequestParams(this.id);

  factory SaltRequestParams.fromJson(Map<String, dynamic> json) =>
  _$SaltRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SaltRequestParamsToJson(this);
}