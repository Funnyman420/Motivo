import 'dart:io';

import 'package:Motivo/api/api-controllers/goals-controller.dart';
import 'package:Motivo/api/api-models/goals/goal.dart';
import 'package:Motivo/providers/home-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalListTile extends StatefulWidget {
  GoalListTile({@required this.goal, @required this.index});

  final Goal goal;
  final int index;

  @override
  _GoalListTileState createState() => _GoalListTileState();
}

class _GoalListTileState extends State<GoalListTile> {
  double currentGoalProgress;
  var isCompleted = false;

  @override
  void initState() {
    super.initState();
    currentGoalProgress = widget.goal.numericCurrent.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      child: Card(
        child: Dismissible(
          key: Key("${widget.goal.hashCode}"),
          background: Container(
            color: Colors.red,
          ),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) =>
              homeState.removeItemFromList(context, widget.goal, widget.index),
          child: Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
            child: AnimatedSwitcher(
                duration: Duration(seconds: 2),
                child: !isCompleted
                    ? Container(
                        key: UniqueKey(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.goal.title,
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: <Widget>[
                                Spacer(),
                                Text(
                                    "${currentGoalProgress.toInt()} / ${widget.goal.numericGoal.toInt()}")
                              ],
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                  trackShape: CustomTrackShape()),
                              child: Slider(
                                value: currentGoalProgress,
                                max: widget.goal.numericGoal.toDouble(),
                                min: 0,
                                label: null,
                                divisions: widget.goal.numericGoal,
                                onChanged: (value) {
                                  setState(() {
                                    currentGoalProgress = value;
                                    homeState.goals[widget.index]
                                        .numericCurrent = value.toInt();
                                  });
                                  if (currentGoalProgress.round() ==
                                      widget.goal.numericGoal) {
                                    setState(() {
                                      isCompleted = true;
                                      homeState.removeItemFromList(
                                          context, widget.goal, widget.index);
                                    });
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        key: UniqueKey(),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.lightBlue,
                          ),
                        ),
                      )),
          ),
        ),
      ),
    );
  }

  _removeItemFromList(Goal goal, int index) async {
    final homeState = Provider.of<HomeState>(context, listen: false);
    homeState.goalsListKey.currentState.removeItem(
        widget.index,
        (context, animation) => SizedBox(
              width: 0,
              height: 0,
            ));
    await deleteItem(goal);
  }

  Future<void> deleteItem(Goal goal) async {
    final homeState = Provider.of<HomeState>(context);
    homeState.goals.remove(goal);
    await GoalsController.deleteGoal(context, goal);
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
