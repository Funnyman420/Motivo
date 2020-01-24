import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login-credentials.g.dart';

@JsonSerializable()
class LoginCredentials {
  final String username;
  final String password;

  LoginCredentials({@required this.username, @required this.password});

  Map<String, dynamic> toJson() => _$LoginCredentialsToJson(this);
}