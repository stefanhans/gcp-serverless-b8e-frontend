import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_event.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_state.dart';

class LandingPageWidget extends StatelessWidget {
  final String appBarTitle = 'Showcase "BookAShare"';

  @override
  Widget build(BuildContext context) {
    final bloc = LandingPageBloc();

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
                onPressed: () => bloc.add(GetVehicles()),
                child: Text(
                  'Send Request',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              BlocBuilder(
                cubit: bloc,
                builder: _buildTextContent,
              )
            ],
          ),
        ));
  }

  Text _buildTextContent(
    BuildContext context,
    LandingPageState state,
  ) {
    if (state is LandingPageInitial) {
      return Text(state.content);
    } else {
      return Text('Loading the request');
    }
  }
}
