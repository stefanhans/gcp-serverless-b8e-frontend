import 'package:bloc/bloc.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_event.dart';
import 'package:gpc_frontend/feature_modules/landing_page/bloc/landing_page_state.dart';
import '../util/net.dart' as net;

void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


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

    // MasterData
    final response = await net.createMasterDataResponse();
    yield LandingPageInitial(response.toJson());

    printWrapped("OUT: " + response.toJson());

    // Users
    // final response = await net.createUsersResponse();
    // yield LandingPageInitial(response[0].toJson());

    // // Vehicles
    // final response = await net.createVehiclesResponse();
    // yield LandingPageInitial(response[0].toJson());

    // // Bookings
    // final response = await net.createBookingsResponse();
    // yield LandingPageInitial(response[0].toJson());
  }
}
