import 'package:flutter/material.dart';

@immutable
class CatalogListData {
  final String title;
  final String subtitle;
  final String imageUrl;
  CatalogListData({
    String listTitle,
    String listSubtitle,
    String imageUrl,
  })  : assert(listTitle?.isNotEmpty ?? false),
        assert(listSubtitle?.isNotEmpty ?? false),
        this.title = listTitle,
        this.subtitle = listSubtitle,
        this.imageUrl = imageUrl;

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
