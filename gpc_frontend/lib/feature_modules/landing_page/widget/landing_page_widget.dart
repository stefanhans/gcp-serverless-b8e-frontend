// import 'package:bloc/bloc.dart';
import 'dart:html';

import 'package:flutter/material.dart';

class LandingPageWidget extends StatelessWidget {
  final String appBarTitle = 'my title';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
    );
  }
}
