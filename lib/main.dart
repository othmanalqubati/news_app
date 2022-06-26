// @dart=2.9
import 'package:flutter/material.dart';
// @dart=2.9
import 'package:news_app/Screens/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utilities/AppTheme.dart';
import 'Screens/Home_Screen.dart';


  Widget _screen;
Future<void> main() async {
  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen=prefs.getBool('seen');
  _screen=OnBoarding();

  if(seen==true)
    {
      _screen=Home_Screen();
    }
 */ runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: OnBoarding(),
    );
  }
}
