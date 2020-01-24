import 'package:Motivo/providers/set-goal-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalRangeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 30, bottom: 10, left: 20),
            child: Row(
              children: <Widget>[
                Text("My Numeric Goal is between..."),
              ],
            ),
          ),
          RangeSlider(
            values: setGoalState.numericGoalRangeValues,
            min: 0,
            max: 1000,
            divisions: 4,
            onChanged: (newRangeValues) {
                setGoalState.onGoalRangeState(newRangeValues);
            },
            labels: RangeLabels(
                '${setGoalState.numericGoalRangeValues.start.toInt()}',
                '${setGoalState.numericGoalRangeValues.end.toInt()}'),
          ),
        ],
      ),
    );
  }
}