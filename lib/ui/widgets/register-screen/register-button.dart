import 'package:Motivo/common/future-states.dart';
import 'package:Motivo/providers/register-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterButton extends StatelessWidget {

  const RegisterButton();

  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        onPressed: () => registerState.tryRegister(context),
        padding: EdgeInsets.all(20),
        color: Theme.of(context).primaryColor,
        child: _buildRegisterHandler(registerState));
  }

     Widget _buildRegisterHandler(RegisterState registerState) {
      var signUpText = Text("Sign Up",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: "Poppins-Medium"));
      switch (registerState.registerLoadingState) {
        case FutureStates.notLoading:
          return signUpText;
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
            color: Colors.white,
          );
        default:
          return signUpText;
      }
    }
}