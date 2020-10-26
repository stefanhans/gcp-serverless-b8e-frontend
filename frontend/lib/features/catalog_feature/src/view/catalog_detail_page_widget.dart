import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/features/catalog_feature/src/data/data.dart';
import 'package:frontend/features/catalog_feature/src/widget/widget.dart';

class CatalogDetailPageWidget extends StatelessWidget {
  final CatalogListData data;

  CatalogDetailPageWidget(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.accentColor,
      appBar: AppBar(
        backgroundColor: theme.canvasColor,
        leading: InkWell(
        splashColor: theme.primaryColorDark,
          child: Icon(Icons.arrow_back,color: theme.primaryColor,),
          onTap: Navigator.of(context).pop,
        ),
        centerTitle: true,
        title: Text(
          data.title,
          style: theme.textTheme.headline1,
        ),
      ),
      body: Center(child: CatalogListVehicleImage(height: 200,),),
    );
  }
}
