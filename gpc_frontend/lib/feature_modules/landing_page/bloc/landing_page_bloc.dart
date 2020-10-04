import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/bloc.dart';
import 'package:gpc_frontend/utility/network/network.dart' as net;


class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  @visibleForTesting
  // Future<String> Function() get vehicleNetworkCall => () => net.createTransaltionResponse();
  LandingPageBloc() : super(LandingPageInitial(null));

  @override
  Stream<LandingPageState> mapEventToState(LandingPageEvent event) async* {
    if (event is GetVehicles) {
      yield* _mapGetVehicles();
    }
  }

  Stream<LandingPageState> _mapGetVehicles() async* {
    yield LandingPageLoading();
    // final response = await vehicleNetworkCall();
    final response = '''{
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}''';
    yield LandingPageInitial(response);
  }
}
