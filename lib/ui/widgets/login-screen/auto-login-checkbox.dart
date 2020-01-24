import 'package:Motivo/providers/login-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AutoLoginCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginState = Provider.of<LoginState>(context);
    return CheckboxListTile(
      value: loginState.rememberMe,
      onChanged: (value) => loginState.onRememberMeChanged(value),
      title: Text(
        "Remember Me",
        style: TextStyle(fontSize: 12),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Theme.of(context).primaryColor,
    );
  }
}
