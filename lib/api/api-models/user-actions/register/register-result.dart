import 'package:json_annotation/json_annotation.dart';
part 'register-result.g.dart';

@JsonSerializable()
class RegisterResult {
  String username;
  String email;


  RegisterResult(this.username, this.email);

  factory RegisterResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterResultFromJson(json);

  @override
  bool operator ==(Object other) =>
      other is RegisterResult &&
      other.username == username &&
      other.email == email;


  @override
  int get hashCode => this.username.hashCode * 31 ^ this.email.hashCode;
}
