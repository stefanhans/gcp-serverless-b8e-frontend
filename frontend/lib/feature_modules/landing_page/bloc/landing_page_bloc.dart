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
     final response = await net.createMasterDataResponse();
//    yield LandingPageInitial(response[0].GeoPoint.toString());
    yield LandingPageInitial(response.toJson());
  }
}
