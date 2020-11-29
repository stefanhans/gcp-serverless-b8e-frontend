import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/features/catalog_feature/src/bloc/catalog_search/bloc.dart';
import 'package:frontend/features/catalog_feature/src/bloc/catalog_search/catalog_search_bloc.dart';
import 'package:frontend/features/catalog_feature/src/widget/catalog_list_search_bar.dart';
import 'package:frontend/features/catalog_feature/src/widget/widget.dart';
import 'package:frontend/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogListPageWidget extends StatelessWidget {
  final CatalogSearchBloc bloc = CatalogSearchBloc();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainTheme.backgroundColor,
      appBar: _defaultAppBar(theme),
      body: CatalogList(),
    );
  }

  AppBar _defaultAppBar(
    ThemeData theme,
  ) {
    return AppBar(
      title: Row(
        children: <Widget>[
          BlocBuilder<CatalogSearchEvent, CatalogSearchState>(
            bloc: bloc,
            builder: (_, state) {
              if (state is CatalogSearchClosed) {
                return Text(
                  'Car Catalog',
                  style: mainTheme.textTheme.headline1,
                );
              } else {
                return Container(
                  height: 30,
                  child: FloatingActionButton(
                    backgroundColor: theme.backgroundColor,
                    child: Icon(
                      Icons.close,
                      color: theme.highlightColor,
                    ),
                    tooltip: 'Close search',
                    onPressed: () => bloc.dispatch(
                      CloseCatalogSearch(),
                    ),
                  ),
                );
              }
            },
          ),
          Spacer(),
          BlocBuilder<CatalogSearchEvent, CatalogSearchState>(
            bloc: bloc,
            builder: (_, state) {
              if (state is CatalogSearchClosed) {
                return Container(
                  height: 40,
                  child: BlocProvider<CatalogSearchBloc>(
                    bloc: bloc,
                    child: CatalogSearchButton(),
                  ),
                );
              } else {
                return Container(
                  color: theme.primaryColor,
                  child: TextField(
                    maxLines: 1,
                    style: theme.textTheme.headline1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  width: 300,
                  height: 30,
                );
              }
            },
          ),
          SizedBox(width: 8),
        ],
      ),
      backgroundColor: theme.canvasColor,
    );
  }
}
