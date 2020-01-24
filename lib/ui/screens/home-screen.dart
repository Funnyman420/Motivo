import 'package:Motivo/providers/home-state.dart';
import 'package:Motivo/ui/widgets/home-screen/app-bar.dart';
import 'package:Motivo/ui/widgets/home-screen/floating-action-button.dart';
import 'package:Motivo/ui/widgets/home-screen/goal-future-builder.dart';
import 'package:Motivo/ui/widgets/home-screen/refresh-indicator.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await _getPermission());
  }

  Future<void> _getPermission() async {
    var permissionHandler = PermissionHandler();
    var contactPermission =
        await permissionHandler.checkPermissionStatus(PermissionGroup.contacts);
    if (contactPermission == PermissionStatus.denied ||
        contactPermission == PermissionStatus.disabled ||
        contactPermission == PermissionStatus.unknown ||
        contactPermission == null) {
      await permissionHandler.requestPermissions([PermissionGroup.contacts]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeState>(
      create: (_) => HomeState(),
      child: Scaffold(
        appBar: HomeAppBar(),
        floatingActionButton: HomeFloatingActionButton(),
        body: HomeRefreshIndicator(
            child: Container(
          child: GoalFutureBuilder(),
        )),
      ),
    );
  }
}
