// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api-response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return ApiResponse<T>(
    json['successful'] as bool,
    errorMessage: json['errorMessage'] as String,
    response:
        (json['response'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'errorMessage': instance.errorMessage,
      'response': instance.response?.map(_Converter<T>().toJson)?.toList(),
    };
