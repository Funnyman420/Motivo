// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCredentials _$RegisterCredentialsFromJson(Map<String, dynamic> json) {
  return RegisterCredentials(
    email: json['email'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterCredentialsToJson(
        RegisterCredentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
