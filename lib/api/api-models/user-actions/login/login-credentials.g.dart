// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCredentials _$LoginCredentialsFromJson(Map<String, dynamic> json) {
  return LoginCredentials(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginCredentialsToJson(LoginCredentials instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
