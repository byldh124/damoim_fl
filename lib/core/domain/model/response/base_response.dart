import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';


//TODO 데이터 결과 처리 과정 변경 후 Data layer로 이동
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
    required this.result,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  bool success() {
    return code == 1000;
  }

  BaseResponse<D> copyWith<D>(D? Function(T?) convertor) {
    if (result != null) {
      final domainModel = convertor(result as T);
      return BaseResponse(code: code, message: message, result: domainModel);
    } else {
      return BaseResponse(code: code, message: message, result: null);
    }
  }

  @override
  String toString() {
    return 'BaseResponse{code: $code, message: $message, result: $result}';
  }
}
