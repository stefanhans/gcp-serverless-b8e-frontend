import 'package:frontend/features/catalog_feature/src/bloc/catalog_search/bloc.dart';
import 'package:bloc/bloc.dart';

class CatalogSearchBloc extends Bloc<CatalogSearchEvent, CatalogSearchState> {
  @override
  CatalogSearchState get initialState => CatalogSearchClosed();

  @override
  Stream<CatalogSearchState> mapEventToState(CatalogSearchEvent event) async* {
    if (event is OpenCatalogSearch) {
      yield CatalogSearchOpen();
    } else if (event is CloseCatalogSearch) {
      yield CatalogSearchClosed();
    }
  }
}
