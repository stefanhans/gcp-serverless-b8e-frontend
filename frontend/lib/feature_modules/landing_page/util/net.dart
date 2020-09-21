import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

import './types.dart';
// //kIsWeb documentation: https://api.flutter.dev/flutter/foundation/kIsWeb-constant.html

String url;
// String text = "";

Future<List<Vehicle>> createMasterDataResponse() async {
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net/get-vehicles';
  } else {
    url =
        'https://europe-west3-serverless-devops-play.cloudfunctions.net/get-vehicles';
  }

  print("url: " + url);

  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{}),
  );
  print("body: " + response.body);

  print(json.decode(response.body));
  Map<String, dynamic> md =
      MasterDataResponse.fromJson(json.decode(response.body)).MasterData[0];

  List<Vehicle> lv = new List<Vehicle>();

//  print("md[GeoPoint]: "+md["GeoPoint"]);

//  Map<String, dynamic> mapGp = json.decode(md["GeoPoint"]);
//
//  print("mapGp[Latitude]: "+mapGp["Latitude"]);

  Geopoint gp = Geopoint(Latitude: 0.1, Longitude: 0.2);
  lv.add(Vehicle(
      DocId: md["DocId"],
      Name: md["Name"],
      Type: md["Type"],
      Status: md["Status"],
      ParkingLot: md["ParkingLot"],
      GeoPoint: gp,
      Description: md["Description"]));

  if (response.statusCode == 200) {
    return lv;
  } else {
    Geopoint gp = Geopoint(Latitude: 0.1, Longitude: 0.2);

    Vehicle v = Vehicle(
        DocId: "a",
        Name: "a",
        Type: "a",
        Status: "a",
        ParkingLot: "",
        GeoPoint: gp,
        Description: "");
    return lv;
    //Vehicles.fromJson(json.decode(response.body))
  }
}

// Future<String> createMasterDataResponse(
//     {String text = "",
//       String sourceLanguage = 'en',
//       String targetLanguage = 'en'}) async {
//   if (kIsWeb) {
//     url =
//     'https://cors-anywhere.herokuapp.com/ https://europe-west3-serverless-devops-play.cloudfunctions.net';
//   } else {
//     url =
//     ' https://europe-west3-serverless-devops-play.cloudfunctions.net';
//   }

//   print("text: " + text);

//   final http.Response response = await http.post(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'clientVersion': "0.0.1",
//       'clientId': "beab10c6-deee-4843-9757-719566214526",
//       'text': text,
//       'sourceLanguage': sourceLanguage,
//       'targetLanguage': targetLanguage,
//     }),
//   );
//   if (response.statusCode == 200) {
// //    translationDisplay.status = "translated";
//     return TranslationResponse.fromJson(json.decode(response.body));
//   } else {
//     return TranslationResponse.error(response.body.toString());
//   }
// }

// class TranslationDisplay {
//   String taskId;
//   String sourceText;
//   String sourceLanguage;
//   String targetText;
//   String targetLanguage;
//   String status;

//   TranslationDisplay(String taskId, String sourceText, String sourceLanguage,
//       String targetText, String targetLanguage, String status) {
//     this.sourceText = sourceText;
//     this.sourceLanguage = sourceLanguage;
//     this.targetText = targetText;
//     this.targetLanguage = targetLanguage;
//     this.status = status;
//   }
// }

// class Translator {
//   String clientVersion;
//   String clientId;
//   String text;
//   String sourceLanguage;
//   String targetLanguage;

//   Translator(String clientVersion, String clientId, String text,
//       String sourceLanguage, String targetLanguage) {
//     this.clientVersion = clientVersion;
//     this.clientId = clientId;
//     this.text = text;
//     this.sourceLanguage = sourceLanguage;
//     this.targetLanguage = targetLanguage;
//   }

//   String toJson() {
//     return ('{ \n"clientVersion": ${this.clientVersion}, '
//         '\n"clientId": ${this.clientId}, '
//         '\n"text": ${this.text}, '
//         '\n"sourceLanguage": ${this.sourceLanguage}, '
//         '\n"targetLanguage": ${this.targetLanguage}, '
//         '\n}');
//   }
// }

// class TranslationResponse {
//   final String taskId;
//   final String translatedText;
//   final List<String> loadCommands;

//   TranslationResponse({this.taskId, this.translatedText, this.loadCommands});

//   factory TranslationResponse.fromJson(Map<String, dynamic> json) {
//     print("factory TranslationResponse");
//     print(json.toString());

//     print("####");
//     print(translator.toJson());
//     print("####");

// //    translationDisplay.taskId = json['taskId'];
// //    translationDisplay.sourceLanguage = translator.sourceLanguage;
// //    translationDisplay.sourceText = translator.text;
// //    translationDisplay.targetLanguage = translator.targetLanguage;
// //    translationDisplay.targetText = json['translatedText'];

//     translator.sourceLanguage = translator.targetLanguage;

//     return TranslationResponse(
//       taskId: json['taskId'],
//       translatedText: json['translatedText'],
//       loadCommands: json['loadCommands'].cast<String>(),
//     );
//   }

//   factory TranslationResponse.error(String description) {
//     print("factory TranslationResponse error");
//     print(description);
//     return TranslationResponse(
//       taskId: "error",
//       translatedText: description,
//       loadCommands: null,
//     );
//   }
// }
