import 'package:Motivo/main.dart';

class HeaderKeys {
  static get authorization => "Authorization";
  static get userAgent => "User-Agent";
  static get accept => "Accept";
  static get connection => "Connection";
  static get contentType => "Content-Type";
}

class AcceptValues {
  static get applicationJson => "application/json";
}

class AuthorizationValues {
  static String getToken() {
   
    var jwtToken = sharedPreferences.getString("jwt"); 
    return 'Bearer $jwtToken';
  }
}