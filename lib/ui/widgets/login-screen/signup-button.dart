import 'package:Motivo/ui/animations/scale-route.dart';
import 'package:Motivo/ui/screens/register-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(context, ScaleRoute(page: RegisterScreen())),
      child: Text(
        "Sign Up",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 13,
            fontFamily: "Poppins-Medium"),
      ),
    );
  }
}