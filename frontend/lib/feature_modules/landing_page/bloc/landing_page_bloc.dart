import 'package:bloc/bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_event.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_state.dart';
import '../util/net.dart' as net;


class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial(null));

  @override
  Stream<LandingPageState> mapEventToState(LandingPageEvent event) async* {
    if (event is GetVehicles) {
      yield* _mapGetVehicles();
    }
  }

  Stream<LandingPageState> _mapGetVehicles() async* {
    yield LandingPageLoading();
//    final response = await Future.delayed(const Duration(seconds: 3), () => '''{
//    "glossary": {
//        "title": "example glossary",
//		"GlossDiv": {
//            "title": "S",
//			"GlossList": {
//                "GlossEntry": {
//                    "ID": "SGML",
//					"SortAs": "SGML",
//					"GlossTerm": "Standard Generalized Markup Language",
//					"Acronym": "SGML",
//					"Abbrev": "ISO 8879:1986",
//					"GlossDef": {
//                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
//						"GlossSeeAlso": ["GML", "XML"]
//                    },
//					"GlossSee": "markup"
//                }
//            }
//        }
//    }
//}''');
     final response = await net.createMasterDataResponse();
//    yield LandingPageInitial(response[0].GeoPoint.toString());
    yield LandingPageInitial(response[0].DocId);
  }
}
