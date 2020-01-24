import 'package:Motivo/common/future-states.dart';
import 'package:Motivo/providers/login-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () async => await loginState.tryLogin(context),
      padding: EdgeInsets.all(20),
      child: _loginButtonHandler(loginState),
    );
  }

    Widget _loginButtonHandler(LoginState loginState) {
    var signInText =
        Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16));

    switch (loginState.loginLoadingState) {
      case FutureStates.notLoading:
        return signInText;
      case FutureStates.loading:
        return Container(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 3,
          ),
        );
      case FutureStates.successful:
        return Icon(
          Icons.check,
          color: Colors.white,
        );
      case FutureStates.unsuccessful:
        return Icon(
          Icons.error,
          color: Colors.white
        );
        break;
      default:
        return signInText;
    }
  }
}
