import 'package:Motivo/providers/home-state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRefreshIndicator extends StatelessWidget {
  final Widget child;

  HomeRefreshIndicator({@required this.child});

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    return RefreshIndicator(
      key: homeState.refreshIndicatorKey,
      color: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      onRefresh: homeState.refreshGoals,
      child: child,
    );
  }
}