import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:frontend/feature_modules/landing_page/types/types.dart';
import 'package:http/http.dart' as http;

// //kIsWeb documentation: https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html

// Todo: Create class for network stuff

String url;
// String text = "";

Future<MasterData> createMasterDataResponse() async {
  print("CALL: util/net.dart createMasterDataResponse()");
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-master-data';
  } else {
    url =
        'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-master-data';
  }

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

  if (response.statusCode == 200) {
    return _masterData;
  } else {
    return _masterData;
  }
}

//
Future<List<User>> createUsersResponse() async {
  print("CALL: util/net.dart createUsersResponse()");
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-users';
  } else {
    url =
        'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-users';
  }

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

  if (response.statusCode == 200) {
    return _users;
  } else {
    return _users;
  }
}

Future<List<Vehicle>> createVehiclesResponse() async {
  print("CALL: util/net.dart createVehiclesResponse()");
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-vehicles';
  } else {
    url =
        'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-vehicles';
  }

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

  if (response.statusCode == 200) {
    return _vehicles;
  } else {
    return _vehicles;
  }
}

//

Future<List<Booking>> createBookingsResponse() async {
  print("CALL: util/net.dart createBookingsResponse()");
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-bookings';
  } else {
    url =
        'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-bookings';
  }

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

  if (response.statusCode == 200) {
    return _bookings;
  } else {
    return _bookings;
  }
}
