import 'package:Motivo/api/api-controllers/user-actions-controller.dart';
import 'package:Motivo/api/api-models/user-actions/login/login-credentials.dart';
import 'package:Motivo/common/future-states.dart';
import 'package:Motivo/main.dart';
import 'package:Motivo/ui/animations/slide-right-route.dart';
import 'package:Motivo/ui/screens/home-screen.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _rememberMe = false;
  var _loginLoadingState = FutureStates.notLoading;

  //Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  bool get rememberMe => _rememberMe;
  int get loginLoadingState => _loginLoadingState;

  void onRememberMeChanged(bool value) {
    sharedPreferences.setBool("rememberMe", value);
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> tryLogin(BuildContext context) async {
    if (_loginLoadingState != FutureStates.notLoading) return;

    var username = _usernameController.text;
    var password = _passwordController.text;

    var credentials = LoginCredentials(username: username, password: password);
    _loginLoadingState = FutureStates.loading;
    notifyListeners();

    var loginResult =
        await UserActionsController.loginAsync(context, credentials);
    if (loginResult.successful) {
      _loginLoadingState = FutureStates.successful;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.push(context, SlideRightRoute(page: HomeScreen()));
      _loginLoadingState = FutureStates.notLoading;
      notifyListeners();
    } else {
      _loginLoadingState = FutureStates.unsuccessful;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 300));
      _loginLoadingState = FutureStates.notLoading;
      notifyListeners();
    }
  }
}
