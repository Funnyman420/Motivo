import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {

  HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Motivo",
          style: TextStyle(
              color: Colors.white, fontSize: 26),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 7,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}