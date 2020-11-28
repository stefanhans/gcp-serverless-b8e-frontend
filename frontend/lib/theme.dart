import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData get mainTheme => ThemeData(
      primaryColor: Colors.blueGrey.shade400,
      primaryColorDark: Colors.blueGrey.shade700,
      primaryColorLight: Colors.blueGrey.shade100,
      highlightColor: Colors.amber,
      textTheme: mainTextTheme,
      errorColor: Colors.red.shade900,
      canvasColor: Colors.blueGrey.shade700,
      accentColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.blueGrey.shade400,
      scaffoldBackgroundColor: Colors.blueGrey.shade400,
    );

TextTheme get mainTextTheme => TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      subtitle1: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
