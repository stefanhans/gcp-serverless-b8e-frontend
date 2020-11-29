import 'package:flutter/material.dart';

@immutable
abstract class CatalogSearchState {}

class CatalogSearchClosed extends CatalogSearchState{}
class CatalogSearchOpen extends CatalogSearchState {}