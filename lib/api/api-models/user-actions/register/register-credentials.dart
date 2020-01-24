import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-credentials.g.dart';

@JsonSerializable()
class RegisterCredentials {
  
  final String email;
  final String username;
  final String password;

  RegisterCredentials({@required this.email, @required this.username,@required this.password});

  Map<String, dynamic> toJson() => _$RegisterCredentialsToJson(this);
}