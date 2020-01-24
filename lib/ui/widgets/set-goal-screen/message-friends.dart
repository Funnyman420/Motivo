import 'package:Motivo/providers/set-goal-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeFriendsSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setGoalState = Provider.of<SetGoalState>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 30, bottom: 10, left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Text("Challenge your friends"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1,
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            width: 65,
            child: Switch(
              value: setGoalState.messageFriends,
              onChanged: (value) {
                setGoalState..onMessageFriendsChanged(value);
              },
              materialTapTargetSize:
                  MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ],
      ),
    );
  }
}