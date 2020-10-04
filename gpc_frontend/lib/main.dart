import 'package:flutter/material.dart';
import 'package:gpc_frontend/feature_modules/landing_page/landing_page.dart';

void main() {
  runApp(GcpApp());
}

class GcpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Cloud Plattform App',
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
