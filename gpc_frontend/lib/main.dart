import 'package:flutter/material.dart';
import 'package:gpc_frontend/feature_modules/landing_page/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[300],
        primaryColorLight: Colors.blueGrey[100],
        primaryColorDark: Colors.black,
        accentColor: Colors.lightBlue[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPageWidget(),
    );
  }
}
