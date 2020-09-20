// import 'package:bloc/bloc.dart';
import 'dart:ui';

import 'package:flutter/material.dart';

class LandingPageWidget extends StatelessWidget {
  final String appBarTitle = 'Showcase "BookAShare"';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => {

                },
                child: Text(
                  'Load JSON',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '',
                ),
              )
            ],
          ),
        ));
  }
}
