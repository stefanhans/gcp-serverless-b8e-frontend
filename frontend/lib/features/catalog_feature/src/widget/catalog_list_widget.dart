import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/catalog_feature/src/widget/catalog_list_vehicle_image.dart';

import '../catalog_feature.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CatalogListCard(CatalogListData.dummyData(
          'First Car',
          'This is some long really unnecessary subtitle, like really it is just too long!',
        )),
        CatalogListCard(CatalogListData.dummyData(
          'Second Car',
          'Hey look at me, I am a car.',
        )),
        CatalogListCard(CatalogListData.dummyData()),
      ],
    );
  }
}

class CatalogListCard extends StatelessWidget {
  final CatalogListData data;

  CatalogListCard(this.data);

  @override
  Widget build(Object context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Container(
        height: 250,
        child: Card(
          color: theme.canvasColor,
          child: InkWell(
            onTap: () {
              //TODO: replace with push for details of vehicle
              showAboutDialog(context: context);
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.title,
                      style: theme.textTheme.headline6,
                    ),
                    SizedBox.fromSize(size: Size.fromHeight(6.0)),
                    Text(data.subtitle),
                    SizedBox.fromSize(size: Size.fromHeight(4.0)),
                    CatalogListVehicleImage(
                      () async { //TODO: replace with network image that loads
                        await Future.delayed(const Duration(seconds: 5));
                        return AssetImage('assets/photo/vehicleEmpty.png');
                      }.call(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          shadowColor: theme.backgroundColor,
          elevation: 8,
        ),
      ),
    );
  }
}
