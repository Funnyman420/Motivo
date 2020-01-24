import 'package:Motivo/api/api-models/api-response.dart';
import 'package:Motivo/api/api-models/user-actions/login/login-credentials.dart';
import 'package:Motivo/api/api-models/user-actions/login/login-result.dart';
import 'package:Motivo/api/api-models/user-actions/register/register-credentials.dart';
import 'package:Motivo/api/api-models/user-actions/register/register-result.dart';
import 'package:Motivo/api/api-routes/user-actions-routes.dart';
import 'package:Motivo/api/headers/keys-values.dart';
import 'package:Motivo/main.dart';
import 'package:flutter/material.dart';
import 'package:Motivo/extensions/ioclient.dart';
import 'dart:convert';
import 'dart:io';

class UserActionsController {
  static Future<ApiResponse<LoginResult>> loginAsync(
      BuildContext context, LoginCredentials loginCredentials) async {
    var client = HttpClient().getIOClient();

    var response = await client.post(UserActionsRoutes.login,
        headers: {
          HeaderKeys.accept: AcceptValues.applicationJson,
          HeaderKeys.contentType: AcceptValues.applicationJson
        },
        body: json.encode(loginCredentials.toJson()));

    client.close();

    var apiResponse =
        ApiResponse<LoginResult>.fromJson(json.decode(response.body));
    if (apiResponse.successful) {
      await sharedPreferences.setString("jwt", apiResponse.response[0].token);
    }

    return apiResponse;
  }

  static Future<ApiResponse<RegisterResult>> registerAsync(
      BuildContext context, RegisterCredentials registerCredentials) async {
    var client = HttpClient().getIOClient();

    var response = await client.post(UserActionsRoutes.register,
        headers: {
          HeaderKeys.accept: AcceptValues.applicationJson,
          HeaderKeys.contentType: AcceptValues.applicationJson
        },
        body: json.encode(registerCredentials.toJson()));

    client.close();

    var apiResponse =
        ApiResponse<RegisterResult>.fromJson(json.decode(response.body));

    return apiResponse;
  }
}
