import 'package:flutter/material.dart';
import 'package:frontend/features/catalog_feature/src/catalog_feature.dart';
import 'package:frontend/theme.dart';

void main() {
  runApp(BookAShare());
}

class BookAShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'BookAShare', //TODO: replace hard coded strings with references to SID's
      theme: mainTheme,
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
      CatalogListEntryPoint(),
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
          backgroundColor: theme.primaryColorDark,
          selectedItemColor: theme.highlightColor,
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
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages),//TODO: find better icon
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        backgroundColor: theme.backgroundColor,
      ),
    );
  }
}
