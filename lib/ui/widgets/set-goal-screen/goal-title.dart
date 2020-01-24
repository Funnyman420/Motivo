import 'package:Motivo/providers/set-goal-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalTitleTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
        autocorrect: true,
        controller: setGoalState.goalTitleController,
        validator: (String value) {
          if (value.isEmpty) return "Please write your goal";

          // if (!value.contains(r"\d+"))
          //   return "Please insert your Numeric Goal";

          return null;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue)),
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: 'Type \$ instead of Numeric Goal',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedErrorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            errorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red))),
    ),
      );
  }
}