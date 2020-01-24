import 'package:Motivo/providers/home-state.dart';
import 'package:Motivo/ui/widgets/home-screen/goal-item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoalsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    return AnimatedList(
      key: homeState.goalsListKey,
      initialItemCount: homeState.goals.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: GoalListTile(
            goal: homeState.goals[index],
            index: index,
          ),
        );
      },
    );
  }
}
