import 'package:flutter/material.dart';
import 'package:frontend/features/catalog_feature/src/data/data.dart';

@immutable
class CatalogArguments {
  final CatalogListData data;

  bool get isDetail => data != null;

  CatalogArguments.detail(this.data);
  CatalogArguments.home() : data = null;
}
