import 'package:Motivo/api/api-controllers/user-actions-controller.dart';
import 'package:Motivo/api/api-models/user-actions/register/register-credentials.dart';
import 'package:Motivo/common/future-states.dart';
import 'package:Motivo/ui/animations/scale-route.dart';
import 'package:Motivo/ui/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RegisterState with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  var _registerLoadingState = FutureStates.notLoading;

  // Getters
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get emailController => _emailController;
  int get registerLoadingState => _registerLoadingState;

  Future<void> tryRegister(BuildContext context) async {
    if (_registerLoadingState != FutureStates.notLoading) return;

    var username = _usernameController.text;
    var password = _passwordController.text;
    var email = _emailController.text;

    var credentials = RegisterCredentials(
        email: email, password: password, username: username);

    _registerLoadingState = FutureStates.loading;
    notifyListeners();

    var registerResult =
        await UserActionsController.registerAsync(context, credentials);

    if (registerResult.successful) {
      _registerLoadingState = FutureStates.successful;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.push(context, ScaleRoute(page: LoginScreen()));
      _registerLoadingState = FutureStates.notLoading;
      notifyListeners();
    } else {
      _registerLoadingState = FutureStates.unsuccessful;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 300));
      _registerLoadingState = FutureStates.notLoading;
      notifyListeners();
    }
  }
}
