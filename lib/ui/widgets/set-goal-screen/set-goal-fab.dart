import 'package:Motivo/api/api-controllers/goals-controller.dart';
import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:Motivo/providers/set-goal-state.dart';
import 'package:Motivo/ui/animations/scale-route.dart';
import 'package:Motivo/ui/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SetGoalActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () async {
        //  var validate = setGoalState.goalKey.currentState.validate();
        //  if (!validate) return;
        print(setGoalState);

        final goal = setGoalState.getGoal();
        var result = await GoalsController.setGoal(context, goal);
        if (setGoalState.messageFriends) {
          var message =
              "Your friend is challenging you to ${setGoalState.goalTitleController.text} using Motivo";

          var selectedPhones = setGoalState.selectedContacts.entries
              .where((contactMapValue) => contactMapValue.value == true)
              .map((acceptedMapValue) => acceptedMapValue.key.phones.first.value.replaceAll(" ", ""))
              .toList();
          var smsResult = await FlutterSms.sendSMS(message: message, recipients: selectedPhones);
        }
        Navigator.push(context, ScaleRoute(page: HomeScreen()));
      },
    );
  }
}
