import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/bloc.dart';

class LandingPageWidget extends StatelessWidget {
  final String appBarTitle = 'Network Request';

  var _btnFontSize = 12.0;
  var _txtFontSize = 12.0;

  @override
  Widget build(BuildContext context) {
    final bloc = LandingPageBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
      ),
      body: BlocListener(
        cubit: bloc,
        listener: (context, state) {
          if (state is LandingPageInitial && state.content != null) {
            Fluttertoast.showToast(
              msg: 'Received Response after 4 seconds.',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                  color: Theme.of(context).primaryColorLight,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: BlocBuilder(
                      cubit: bloc,
                      builder: _buildTextContent,
                    ),
                  ),
                ),
              ),
              Spacer(),
              BlocBuilder(
                  cubit: bloc,
                  builder: (context, state) {
                    return RaisedButton(
                      onPressed: state is LandingPageInitial
                          ? () => bloc.add(GetMasterData())
                          : null,
                      child: Text(
                        state is LandingPageLoading
                            ? 'Awaiting Master Data'
                            : 'Load Master Data',
                        style: TextStyle(
                          fontSize: _btnFontSize,
                        ),
                      ),
                    );
                  }),
              BlocBuilder(
                  cubit: bloc,
                  builder: (context, state) {
                    return RaisedButton(
                      onPressed: state is LandingPageInitial
                          ? () => bloc.add(GetUsers())
                          : null,
                      child: Text(
                        state is LandingPageLoading
                            ? 'Awaiting Users'
                            : 'Load Users',
                        style: TextStyle(
                          fontSize: _btnFontSize,
                        ),
                      ),
                    );
                  }),
              BlocBuilder(
                  cubit: bloc,
                  builder: (context, state) {
                    return RaisedButton(
                      onPressed: state is LandingPageInitial
                          ? () => bloc.add(GetVehicles())
                          : null,
                      child: Text(
                        state is LandingPageLoading
                            ? 'Awaiting Vehicles'
                            : 'Load Vehicles',
                        style: TextStyle(
                          fontSize: _btnFontSize,
                        ),
                      ),
                    );
                  }),
              BlocBuilder(
                  cubit: bloc,
                  builder: (context, state) {
                    return RaisedButton(
                      onPressed: state is LandingPageInitial
                          ? () => bloc.add(GetBookings())
                          : null,
                      child: Text(
                        state is LandingPageLoading
                            ? 'Awaiting Bookings'
                            : 'Load Bookings',
                        style: TextStyle(
                          fontSize: _btnFontSize,
                        ),
                      ),
                    );
                  }),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Scrollbar _buildTextContent(
    BuildContext context,
    LandingPageState state,
  ) {
    ThemeData theme = Theme.of(context);
    Widget contentWidget;
    if (state is LandingPageInitial) {
      contentWidget = Text(
        state.content ?? 'No Content',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: _txtFontSize,
          color: theme.primaryColorDark,
        ),
        maxLines: 30,
      );
    } else if (state is LandingPageLoading) {
      contentWidget = SpinKitRipple(
        color: theme.primaryColor,
        size: 270.0,
      );
    }
    return Scrollbar(
      child: SingleChildScrollView(
        child: contentWidget,
      ),
    );
  }
}
