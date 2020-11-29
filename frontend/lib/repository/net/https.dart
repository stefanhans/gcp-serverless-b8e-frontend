import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import '../types/types.dart';
import 'package:http/http.dart' as http;

// //kIsWeb documentation: https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html

// Todo: Create class for network stuff

String getUrl() {
  const String urlForWeb = 'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-users';
  const String urlForDefault = 'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-users';

  return kIsWeb ? urlForWeb : urlForDefault;
}

String url = getUrl();



Future<MasterData> createMasterDataResponse() async {
  print("CALL: util/net.dart createMasterDataResponse()");

  print("net.dart url: " + url);

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );

  print("net.dart body: " + response.body);

  MasterData _masterData = MasterData.fromJson(json.decode(response.body));

  print("ZZZZ: " + _masterData.usersToJson());

  // Todo: Error handling
  // if (response.statusCode == 200) {
  //   return _masterData;
  // } else {
  //   return _masterData;
  // }
  return _masterData;
}

//
Future<List<User>> createUsersResponse() async {
  print("CALL: util/net.dart createUsersResponse()");

  print("net.dart url: " + url);

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );
  print("net.dart createUsersResponse() body: " + response.body);

  List<User> _users = new List<User>();
  for (var user in json.decode(response.body)) {
    _users.add(User.fromJson(user));
  }

  // List<User> users = MasterData.fromJson(json.decode(response.body)).users;

  // Todo: Error handling
  // if (response.statusCode == 200) {
  //   return _masterData;
  // } else {
  //   return _masterData;
  // }
  return _users;
}

Future<List<Vehicle>> createVehiclesResponse() async {
  print("CALL: util/net.dart createVehiclesResponse()");

  print("net.dart url: " + url);

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );
  print("net.dart createVehiclesResponse() body: " + response.body);

  // List<Vehicle> _vehicles = MasterData.fromJson(json.decode(response.body)).vehicles;

  List<Vehicle> _vehicles = new List<Vehicle>();
  for (var vehicle in json.decode(response.body)) {
    _vehicles.add(Vehicle.fromJson(vehicle));
  }

  // Todo: Error handling
  // if (response.statusCode == 200) {
  //   return _vehicles;
  // } else {
  //   return _vehicles;
  // }
  return _vehicles;
}

//

Future<List<Booking>> createBookingsResponse() async {
  print("CALL: util/net.dart createBookingsResponse()");

  print("net.dart url: " + url);

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );
  print("net.dart createVehiclesResponse() body: " + response.body);

  List<Booking> _bookings = new List<Booking>();
  for (var booking in json.decode(response.body)) {
    _bookings.add(Booking.fromJson(booking));
  }

  // Todo: Error handling
  // if (response.statusCode == 200) {
  //   return _bookings;
  // } else {
  //   return _bookings;
  // }
  return _bookings;
}
