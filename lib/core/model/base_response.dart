import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: true)
class BaseResponse<T> {
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'result')
  final T? result;

  BaseResponse({
    required this.code,
    required this.message,
    this.result,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  bool success() {
    return code == 1000;
  }

  @override
  String toString() {
    return 'BaseResponse{code: $code, message: $message, result: $result}';
  }
}