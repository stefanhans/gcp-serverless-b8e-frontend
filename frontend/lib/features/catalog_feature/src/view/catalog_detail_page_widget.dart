import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/features/catalog_feature/src/data/data.dart';

class CatalogDetailPageWidget extends StatelessWidget {
  final CatalogListData data;

  CatalogDetailPageWidget(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.close),
          onTap: Navigator.of(context).pop,
        ),
        centerTitle: true,
        title: Text(data.title),
      ),
    );
  }
}
