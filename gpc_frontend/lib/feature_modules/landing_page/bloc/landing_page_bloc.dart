import 'package:bloc/bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_event.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_state.dart';
import '../util/net.dart' as http;

const String initialContent = 'ready when you are :)';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial(initialContent));

  @override
  Stream<LandingPageState> mapEventToState(LandingPageEvent event) async* {
    if (event is GetVehicles) {
      yield* _mapGetVehicles();
    }
  }

  Stream<LandingPageState> _mapGetVehicles() async* {
    yield LandingPageLoading();
    final response = await Future.delayed(const Duration(seconds: 3), () => 'your dummy response');
    // final response = await http.createTranslationResponse();
    yield LandingPageInitial(response);
  }
}
