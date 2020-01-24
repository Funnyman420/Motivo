import 'package:Motivo/providers/set-goal-state.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/contact-list.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/goal-app-bar.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/goal-range.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/goal-title.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/goal-value.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/message-friends.dart';
import 'package:Motivo/ui/widgets/set-goal-screen/set-goal-fab.dart';
import 'package:Motivo/ui/widgets/shared/dismissable-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SetGoalState>(
      create: (_) => SetGoalState(),
      child: MotivoDismissableScreen(
        child: Scaffold(
          appBar: SetGoalAppBar(),
          floatingActionButton: SetGoalActionButton(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GoalTitleTextField(),
                GoalRangeSlider(),
                GoalValueSlider(),
                ChallengeFriendsSwitch(),
                ContactList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
