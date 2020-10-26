import 'package:flutter/material.dart';
import 'package:frontend/features/catalog_feature/src/data/catalog_arguments.dart';
import 'package:frontend/features/catalog_feature/src/data/data.dart';
import 'package:frontend/features/catalog_feature/src/view/view.dart';
import 'package:frontend/routes/routes.dart';

import 'view/catalog_detail_page_widget.dart';

class CatalogFeaturePageRoute extends MaterialPageRoute {
  CatalogFeaturePageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  factory CatalogFeaturePageRoute.detail(CatalogListData data) {
    return CatalogFeaturePageRoute(
      builder: (context) => CatalogDetailPageWidget(data),
      settings: RouteSettings(
        arguments: CatalogArguments.detail(data),
      ),
    );
  }
}

class CatalogListEntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatalogListPageWidget(),
      onGenerateRoute: (RouteSettings settings) {
        final CatalogArguments catalogArguments =
            settings.arguments as CatalogArguments;
        if (catalogArguments.isDetail) {
          return SlideRightRoute(
            widget: CatalogDetailPageWidget(
              catalogArguments.data,
            ),
          );
        } else {
          return SlideLeftRoute(
            widget: CatalogListPageWidget(),
          );
        }
      },
      theme: Theme.of(context),
    );
  }
}
