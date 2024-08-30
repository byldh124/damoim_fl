
import 'package:json_annotation/json_annotation.dart';

part 'simple_response.g.dart';

@JsonSerializable()
class SimpleResponse {
  final int code;
  final String message;

  SimpleResponse({required this.code, required this.message});

  factory SimpleResponse.fromJson(Map<String, dynamic> json) =>
  _$SimpleResponseFromJson(json);

  @override
  String toString() {
    return 'SimpleResponse{code: $code, message: $message}';
  }
}