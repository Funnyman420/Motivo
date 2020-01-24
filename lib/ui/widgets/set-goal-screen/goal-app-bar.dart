import 'package:flutter/material.dart';

class SetGoalAppBar extends StatelessWidget with PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Set Goal",
          style: TextStyle(
              color: Colors.white, fontSize: 26),
        ),
      ),
      elevation: 7,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}