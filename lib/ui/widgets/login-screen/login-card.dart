import 'package:Motivo/providers/login-state.dart';
import 'package:Motivo/ui/widgets/shared/form-field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formState = Provider.of<LoginState>(context);
    final _usernameFormField = MotivoInputTextField(
      hint: "Username",
      icon: Icons.person,
      textEditingController: formState.usernameController,
      obsecure: false,
      textInputType: TextInputType.text,
    );

    final _passwordFormField = MotivoInputTextField(
      hint: "Password",
      icon: Icons.lock,
      textEditingController: formState.passwordController,
      obsecure: true,
      textInputType: TextInputType.visiblePassword,
    );

    final _forgotLabel = FlatButton(
      onPressed: () => {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
      ),
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 12),
              blurRadius: 15,
            ),
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -10), blurRadius: 10)
          ]),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      letterSpacing: .6),
                )
              ],
            ),
            Form(
              key: formState.formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                    child: _usernameFormField,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: _passwordFormField,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[_forgotLabel],
            )
          ],
        ),
      ),
    );
  }
}
