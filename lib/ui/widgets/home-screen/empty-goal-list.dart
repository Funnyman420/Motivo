import 'package:flutter/material.dart';

class EmptyGoalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/no-results.png"),
              height: 150,
              
            ),
            Text("It's kinda empty in here..."),
          ],
        ),
      ),
    );

  }
}