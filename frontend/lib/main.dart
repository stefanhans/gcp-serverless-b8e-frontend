import 'package:flutter/material.dart';
import 'features/debug_feature/src/debug_feature.dart';//TODO: optimise imports (artifactory)

void main() {
  runApp(BookAShare());
}

class BookAShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'BookAShare', //TODO: replace hard coded strings with references to SID's
      theme: ThemeData(
        primaryColor: Colors.amber,
        canvasColor: Colors.blueGrey.shade800,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.amber.shade200,
      ),
      home: MainTabPageWidget(),
    );
  }
}

class MainTabPageWidget extends StatefulWidget {
  @override
  _MainTaps createState() {
    final mainTaps = _MainTaps();
    mainTaps.tapViews.addAll([
      //TODO: fill with actual features
      SizedBox.shrink(),
      SizedBox.shrink(),
      SizedBox.shrink(),
    ]);
    return mainTaps;
  }
}

class _MainTaps extends State<MainTabPageWidget> {
  int tabIndex = 0;
  List<Widget> tapViews = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DebugPageWidget(),
    );
  }
}
