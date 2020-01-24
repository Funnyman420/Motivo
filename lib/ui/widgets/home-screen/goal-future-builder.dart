import 'package:Motivo/api/api-models/api-response.dart';
import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:Motivo/providers/home-state.dart';
import 'package:Motivo/ui/widgets/home-screen/empty-goal-list.dart';
import 'package:Motivo/ui/widgets/home-screen/goal-list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    //homeState.getGoals(context).then((_){});
    return FutureBuilder(
      future: homeState.getGoals(context),
      builder:
          (BuildContext context, AsyncSnapshot<ApiResponse<Goal>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            var apiResponse = snapshot.data;
            if (apiResponse.successful) {
              homeState.goals = apiResponse.response;
              if (homeState.goals.isNotEmpty)
                return GoalsList();
              else
                return EmptyGoalList();
            }
            return EmptyGoalList();
          default:
            return EmptyGoalList();
        }
      },
    );
  }
}
