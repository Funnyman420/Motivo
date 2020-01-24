import 'package:json_annotation/json_annotation.dart';

part 'login-result.g.dart';

@JsonSerializable()
class LoginResult {
  String token;
  String username;

  LoginResult(this.token, this.username);

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  @override
  bool operator == (Object other) =>
      other is LoginResult &&
      other.token == token &&
      other.username == username;

  @override
  int get hashCode => token.hashCode * 31 ^ username.hashCode;
}
