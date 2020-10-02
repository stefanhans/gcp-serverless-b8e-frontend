import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

import './types.dart';
// //kIsWeb documentation: https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html

String url;
// String text = "";

Future<MasterData> createMasterDataResponse() async {
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

  print("net.dart body: " + response.body);

  MasterData masterData = MasterData.fromJson(json.decode(response.body));

  // List<Vehicle> vehicles = MasterData.fromJson(json.decode(response.body)).vehicles;


  print("net.dart masterData.toJson(): " + masterData.toJson());


  // print("net.dart vehicles.length: " + vehicles.length.toString());
  // print("net.dart vehicles.toString: " + vehicles.toString());
  // print("net.dart vehicles[0].toJson(): " + vehicles[0].toJson());
  //
  // // for (var v in vehicles) {
  // //   print(v.toJson().toString());
  // //   print("----");
  // // }
  //
  // print("net.dart vehicles.toJson: " + vehicles[0].toJson());
  //
  //
  // print("net.dart geopoint.toJson: " + vehicles[0].GeoPoint.toJson());

  if (response.statusCode == 200) {
    return masterData;
  } else {
    return masterData;
  }
}
