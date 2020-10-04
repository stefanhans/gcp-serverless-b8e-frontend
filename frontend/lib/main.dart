import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: tabIndex,
          children: tapViews,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: theme.canvasColor,
          selectedItemColor: theme.primaryColor,
          unselectedItemColor: theme.accentColor,
          currentIndex: tabIndex,
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
          items: [
            //TODO: replace hard coded titles with references to SID's
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Bookings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Browse'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
        backgroundColor: theme.backgroundColor,
      ),
    );
  }
}
