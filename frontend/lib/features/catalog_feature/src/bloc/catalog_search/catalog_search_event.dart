import 'package:flutter/material.dart';

@immutable
abstract class CatalogSearchEvent {}

class OpenCatalogSearch extends CatalogSearchEvent {}

class CloseCatalogSearch extends CatalogSearchEvent {}
