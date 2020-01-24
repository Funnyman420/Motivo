import 'dart:async';
import 'package:Motivo/main.dart';
import 'package:Motivo/ui/screens/home-screen.dart';
import 'package:Motivo/ui/screens/login-screen.dart';
import 'package:Motivo/ui/widgets/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:Motivo/ui/animations/scale-route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDuration = 4;

  // Runs before build
  @override
  void initState() {
    super.initState();
    _countDownTime();
  }

  /// Timer that shows the logo for 2 seconds or better said for
  /// the splash duration and then reroutes the user to the appropriate
  /// screen.
  Future<Timer> _countDownTime() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var jwtToken = sharedPreferences.getString("jwt");
    var autoLogin = sharedPreferences.getBool("rememberMe");

    return Timer(
        Duration(seconds: splashDuration),
        // Callback Function
        navigateToScreen(jwtToken, autoLogin));
  }

  /// Navigates the user to the correct screen
  /// If the user has decided that he doesn't want to
  /// stay logged in in the app or he hasn't a JWT token
  /// for the app, this function will reroute him to the
  /// LoginScreen. If not it will reroute him to the HomeScreen.
  navigateToScreen(String accessToken, bool autoLogin) {
    if (accessToken == null || autoLogin == false)
      Navigator.push(context, ScaleRoute(page: LoginScreen()));

    if (accessToken != null && autoLogin == true )
      Navigator.push(context, ScaleRoute(page: HomeScreen()));
    else
      Navigator.push(context, ScaleRoute(page: LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Motivo", style: TextStyle(fontSize: 35.0)),
            )
          ],
        ),
      ),
    );
  }
}
