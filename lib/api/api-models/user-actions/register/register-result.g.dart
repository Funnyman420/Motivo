// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResult _$RegisterResultFromJson(Map<String, dynamic> json) {
  return RegisterResult(
    json['username'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$RegisterResultToJson(RegisterResult instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
    };
