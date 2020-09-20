import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_event.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_state.dart';

class LandingPageWidget extends StatelessWidget {
  final String appBarTitle = 'Network Request';

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
        //   Scaffold.of(context).showSnackBar(SnackBar(
        //     content: Text('', style: TextStyle(color: Theme.of(context).primaryColorDark),),
        //     backgroundColor: Theme.of(context).primaryColorLight,
        //   ));
        // }
        // },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
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
                          ? () => bloc.add(GetVehicles())
                          : null,
                      child: Text(
                        state is LandingPageLoading
                            ? 'Awaiting Response'
                            : 'Send Request',
                        style: TextStyle(
                          fontSize: 20,
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
          fontSize: 16.0,
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
