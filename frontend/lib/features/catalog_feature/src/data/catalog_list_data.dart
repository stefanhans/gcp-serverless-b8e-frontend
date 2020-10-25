import 'package:flutter/material.dart';

@immutable
class CatalogListData {
  final String title;
  final String subtitle;
  CatalogListData({
    String listTitle,
    String listSubtitle,
  })  : assert(listTitle?.isNotEmpty ?? false),
        assert(listSubtitle?.isNotEmpty ?? false),
        this.title = listTitle,
        this.subtitle = listSubtitle;

  factory CatalogListData.dummyData([
    String title,
    String subtitle,
  ]) {
    return CatalogListData(
      listTitle: title ?? 'dummy Title',
      listSubtitle: subtitle ?? 'dummy Subtitle',
    );
  }
}
