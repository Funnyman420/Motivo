import 'dart:convert';
import 'dart:io';
import 'package:Motivo/api/api-models/api-response.dart';
import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:Motivo/api/api-routes/goal-routes.dart';
import 'package:Motivo/api/headers/keys-values.dart';
import 'package:flutter/cupertino.dart';
import 'package:Motivo/extensions/ioclient.dart';

class GoalsController {
  static Future<ApiResponse<Goal>> getGoals(BuildContext context) async {
    var client = HttpClient().getIOClient();
    var response = await client.get(GoalRoutes.getGoals, headers: {
      HeaderKeys.authorization: AuthorizationValues.getToken(),
      HeaderKeys.accept: AcceptValues.applicationJson,
      HeaderKeys.contentType: AcceptValues.applicationJson
    });
    client.close();

    return ApiResponse<Goal>.fromJson(json.decode(response.body));
  }

  static Future<ApiResponse<Goal>> setGoal(
      BuildContext context, Goal goal) async {
        print(json.encode(goal.toJson()));
    var client = HttpClient().getIOClient();
    var response = await client.post(GoalRoutes.setGoal,
        headers: {
          HeaderKeys.authorization: AuthorizationValues.getToken(),
          HeaderKeys.accept: AcceptValues.applicationJson,
          HeaderKeys.contentType: AcceptValues.applicationJson
        },
        body: json.encode(goal.toJson()));
    client.close();

    return ApiResponse<Goal>.fromJson(json.decode(response.body));
  }

  static Future<ApiResponse<Goal>> updateGoal(
      BuildContext context, Goal goal) async {
    var client = HttpClient().getIOClient();
    var response = await client.put(GoalRoutes.updateGoal,
        headers: {
          HeaderKeys.authorization: AuthorizationValues.getToken(),
          HeaderKeys.accept: AcceptValues.applicationJson,
          HeaderKeys.contentType: AcceptValues.applicationJson
        },
        body: json.encode(goal.toJson()));
    client.close();

    return ApiResponse<Goal>.fromJson(json.decode(response.body));
  }

  static Future<ApiResponse<Goal>> deleteGoal(
      BuildContext context, Goal generalGoal) async {
    var client = HttpClient().getIOClient();
    var response = await client.delete(
        '${GoalRoutes.deleteGoal}?goalId=${generalGoal.goalId}',
        headers: {
          HeaderKeys.authorization: AuthorizationValues.getToken(),
          HeaderKeys.accept: AcceptValues.applicationJson,
          HeaderKeys.contentType: AcceptValues.applicationJson
        });
    client.close();

    return ApiResponse<Goal>.fromJson(json.decode(response.body));
  }
}
