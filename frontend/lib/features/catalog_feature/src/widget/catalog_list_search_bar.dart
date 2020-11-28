import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/features/catalog_feature/src/bloc/bloc.dart';
import 'package:frontend/features/catalog_feature/src/bloc/catalog_search/catalog_search_bloc.dart';
import 'package:frontend/features/catalog_feature/src/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final dummyList = [
  CatalogListData.dummyData(
    'First Car',
    'This is some long really unnecessary subtitle, like really it is just too long!',
  ),
  CatalogListData.dummyData(
    'Second Car',
    'Hey look at me, I am a car.',
  ),
  CatalogListData.dummyData(),
];

class CatalogSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      backgroundColor: theme.backgroundColor,
      child: Icon(
        Icons.search,
        color: theme.highlightColor,
      ),
      tooltip: 'Search for vehicles',
      onPressed: () => BlocProvider.of<CatalogSearchBloc>(context).dispatch(
        OpenCatalogSearch(),
      ),
    );
  }
}
