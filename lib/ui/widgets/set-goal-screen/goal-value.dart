import 'package:Motivo/providers/set-goal-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalValueSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    var goalMax = setGoalState.numericGoalRangeValues.end;
    var goalMin = setGoalState.numericGoalRangeValues.start;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10, left: 20),
            child: Row(
              children: <Widget>[
                Text("And my Numeric Goal is..."),
              ],
            ),
          ),
          Slider(
            value: setGoalState.numericGoalValue,
            onChanged: goalMax != 0
                ? (newValue) {
                    setGoalState.onGoalValueChanged(newValue);
                  }
                : null,
            min: goalMin,
            max: goalMax != 0 ? goalMax : 1,
            divisions: goalMax != 0 ? goalMax.toInt() : 1,
            label: "${setGoalState.numericGoalValue.toInt()}",
          ),
        ],
      ),
    );
  }
}
