import 'package:Motivo/providers/login-state.dart';
import 'package:Motivo/ui/widgets/login-screen/auto-login-checkbox.dart';
import 'package:Motivo/ui/widgets/login-screen/login-button.dart';
import 'package:Motivo/ui/widgets/login-screen/login-card.dart';
import 'package:Motivo/ui/widgets/login-screen/signup-button.dart';
import 'package:Motivo/ui/widgets/shared/dismissable-screen.dart';
import 'package:Motivo/ui/widgets/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
        create: (_) => LoginState(),
        child: MotivoDismissableScreen(
            child: Scaffold(
                body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Logo(),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 17, 20, 17),
                      child: LoginCard(),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(15),
                      child: AutoLoginCheckbox(),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(20),
                      child: LoginButton(),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: SignUpButton()),
                  ],
                )
              ],
            ),
          ),
        ))));
  }
}
