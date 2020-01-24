import 'package:Motivo/providers/home-state.dart';
import 'package:Motivo/ui/animations/slide-right-route.dart';
import 'package:Motivo/ui/screens/set-goal-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(Icons.add),
      label: Text("Set Goal"),
      foregroundColor: Colors.white,
      onPressed: () =>
        Navigator.push(context, SlideRightRoute(page: SetGoalScreen()))
    );
  }
}