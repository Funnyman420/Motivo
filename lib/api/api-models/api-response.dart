import 'package:json_annotation/json_annotation.dart';
import 'goals/goal.dart';
import 'user-actions/login/login-result.dart';
import 'user-actions/register/register-result.dart';

part 'api-response.g.dart';


/// <summary>
///   This is a class that mirrors the ApiResponse class 
///   in the server-side. Need to make implementation for 
///   parsing the generic type T in order to write less and 
///   reuse code.
/// </summary>
@JsonSerializable()
class ApiResponse<T> {
  @JsonKey(name: "successful")
  final bool successful;

  @JsonKey(name: "errorMessage")
  final String errorMessage;

  @JsonKey(name: "response")
  @_Converter()
  final List<T> response;

  ApiResponse(this.successful, {this.errorMessage, this.response});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic> &&
        json.containsKey('username') &&
        json.containsKey('email')) {
      return RegisterResult.fromJson(json) as T;
    }
    if (json is Map<String, dynamic> &&
        json.containsKey('token') &&
        json.containsKey('username')) {
      return LoginResult.fromJson(json) as T;
    }

    if (json is Map<String, dynamic> &&
    json.containsKey("goalId") &&
    json.containsKey("title") &&
    json.containsKey("numericCurrent") &&
    json.containsKey("numericGoal")) {
      return Goal.fromJson(json) as T;
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
