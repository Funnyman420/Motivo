import 'package:Motivo/common/future-states.dart';
import 'package:Motivo/providers/register-state.dart';
import 'package:Motivo/ui/widgets/register-screen/register-button.dart';
import 'package:Motivo/ui/widgets/shared/dismissable-screen.dart';
import 'package:Motivo/ui/widgets/shared/form-field.dart';
import 'package:Motivo/ui/widgets/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);

    return ChangeNotifierProvider<RegisterState>(
      create: (_) => RegisterState(),
      child: MotivoDismissableScreen(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Register",
              style: TextStyle(
                  fontSize: 24, fontFamily: "Poppins-Bold", letterSpacing: .6),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Logo(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Join Motivo",
                          style: TextStyle(
                              fontFamily: "Poppins-Medium", fontSize: 20))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MotivoInputTextField(
                              hint: "Username",
                              obsecure: false,
                              textEditingController: registerState.usernameController,
                              icon: Icons.person,
                              textInputType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MotivoInputTextField(
                              hint: "Password",
                              obsecure: true,
                              textEditingController: registerState.passwordController,
                              icon: Icons.lock,
                              textInputType: TextInputType.visiblePassword,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MotivoInputTextField(
                              hint: "Email",
                              obsecure: false,
                              textEditingController: registerState.emailController,
                              icon: Icons.mail,
                              textInputType: TextInputType.emailAddress,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                          child: Container(
                            width: 150,
                            child: RegisterButton(),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

