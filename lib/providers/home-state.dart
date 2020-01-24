import 'package:Motivo/api/api-controllers/goals-controller.dart';
import 'package:Motivo/api/api-models/api-response.dart';
import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  final _goalsListKey = GlobalKey<AnimatedListState>();
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  List<Goal> _goals;
  AnimationController _emptyListController;
  Future<ApiResponse<Goal>> _goalsFuture;
  Future<ApiResponse<Goal>> _refreshGoals;

  //Getters
  GlobalKey<AnimatedListState> get goalsListKey => _goalsListKey;
  GlobalKey<RefreshIndicatorState> get refreshIndicatorKey =>
      _refreshIndicatorKey;
  List<Goal> get goals => _goals;
  AnimationController get emptyListController => _emptyListController;
  Future<ApiResponse<Goal>> get goalsFuture => _goalsFuture;
  //Future<ApiResponse<Goal>> get refreshGoals => _refreshGoals;

  set goals(List<Goal> goalList) {
    _goals = goalList;
  }

  void addGoal(Goal goal) {
    _goals.insert(0, goal);
  }

  // Future<void> initHomeState() {
  //   _emptyListController = AnimationController(
  //     vsync: this
  //   )
  // }

  // Getters
  Future<void> refreshGoals() async {
    // TODO: Implement refresh of goals
  }

  Future<ApiResponse<Goal>> getGoals(BuildContext context) async {
    return await GoalsController.getGoals(context);
  }

  Future<void>removeItemFromList(BuildContext context, Goal goal, int index) async {
    _goalsListKey.currentState.removeItem(
        index,
        (context, animation) => SizedBox(
              width: 0,
              height: 0,
            ));
    _goals.remove(goal);
    await GoalsController.deleteGoal(context, goal);
  }
}
