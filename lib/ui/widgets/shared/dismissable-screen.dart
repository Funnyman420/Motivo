import 'package:flutter/material.dart';

class MotivoDismissableScreen extends StatelessWidget {

  // Widget that enables the dismissal of a TextField or a TextFormField Widget.
  
  MotivoDismissableScreen({@required this.child});

  // The actual body of the screen 
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: this.child,
    );
  }
}