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
          child: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
          onTap: Navigator.of(context).pop,
        ),
        centerTitle: true,
        title: Text(
          data.title,
          style: theme.textTheme.headline1,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                child: CatalogListVehicleImage(
                  height: 300,
                  futureImage: () async {
                    //TODO: replace with network image that loads
                    await Future.delayed(const Duration(seconds: 5));
                    return AssetImage('assets/photo/vehicleEmpty.png');
                  }.call(),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                data.subtitle,
                style: theme.textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
