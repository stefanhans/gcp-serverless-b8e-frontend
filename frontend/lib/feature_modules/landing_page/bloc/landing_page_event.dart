import 'package:equatable/equatable.dart';

class LandingPageEvent extends Equatable {
  const LandingPageEvent();
  @override
  List<Object> get props => [];
}

class GetMasterData extends LandingPageEvent {}

class GetUsers extends LandingPageEvent {}

class GetVehicles extends LandingPageEvent {}

class GetBookings extends LandingPageEvent {}