import 'package:Motivo/ui/screens/home-screen.dart';
import 'package:Motivo/ui/screens/login-screen.dart';
import 'package:Motivo/ui/screens/register-screen.dart';
import 'package:Motivo/ui/screens/splash-screen.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

void main() => runApp(Motivo());

class Motivo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColorBrightness: Brightness.dark,
        sliderTheme: SliderThemeData(
          valueIndicatorTextStyle: TextStyle(color: Colors.white)
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white
        ),
        buttonColor: Colors.lightBlue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightBlue,textTheme: ButtonTextTheme.primary
        ),
        primaryTextTheme: TextTheme(button: TextStyle(color: Colors.white)),
        accentTextTheme: TextTheme(button: TextStyle(color: Colors.lightBlue)),
        fontFamily: "Poppins"
      ),
      routes: <String, WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => HomeScreen(),
        "/LoginScreen": (BuildContext context) => LoginScreen(),
        "/RegisterScreen": (BuildContext context) => RegisterScreen()
      },
      home: SplashScreen() 
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await _getPermission();
        });
  }

  void _incrementCounter() async {
    if (await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts) == PermissionStatus.granted) {
      var contacts = await ContactsService.getContacts();
      print(contacts);
    }
  }

  _getPermission() async {
    await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
