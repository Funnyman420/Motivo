
import 'api-base-route.dart';

class GoalRoutes {
  static String get controller => "${Api.base}/goals";
  static String get getGoals => "$controller/get-goals";
  static String get setGoal => "$controller/set-goal";
  static String get deleteGoal => "$controller/delete-goal";
  static String get updateGoal => "$controller/update-goal";   
}