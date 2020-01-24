import 'api-base-route.dart';

class UserActionsRoutes {
  static String get controller => "${Api.base}/useractions";
  static String get login => "$controller/login";
  static String get register => "$controller/register"; 
}