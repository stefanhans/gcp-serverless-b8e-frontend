class Geopoint {
  double Latitude;
  double Longitude;

  Geopoint({double Latitude, double Longitude}) {
    this.Latitude = Latitude;
    this.Longitude = Longitude;
  }

  factory Geopoint.fromJson(Map<String, dynamic> json) {
    print("types.dart Geopoint:");
    print(json.toString());

    return Geopoint(
      Latitude: double.parse(json["latitude"].toString()),
      Longitude: double.parse(json["longitude"].toString())
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'latitude': Latitude,
        'longitude': Longitude,
      };

  String toString() {
    return "Geopoint:\n"
        +"\tlatitude: "+this.Latitude.toString()+"\n"
        +"\tlongitude: "+this.Longitude.toString()+"\n";
  }
}

class Vehicle {
  String DocId;
  String Name;
  String Type;
  String Status;
  String ParkingLot;
  Geopoint GeoPoint;
  String Description;

  Vehicle(
      {String DocId,
      String Name,
      String Type,
      String Status,
      String ParkingLot,
      Geopoint GeoPoint,
      String Description}) {
    this.DocId = DocId;
    this.Name = Name;
    this.Type = Type;
    this.Status = Status;
    this.ParkingLot = ParkingLot;
    this.GeoPoint = GeoPoint;
    this.Description = Description;
  }

  String toString() {
    return "Vehicle:\n"
        +"DocId: "+this.DocId+"\n"
        +"Name: "+this.Name+"\n"
        +"Type: "+this.Type+"\n"
        +"Status: "+this.Status+"\n"
        +"ParkingLot: "+this.ParkingLot+"\n"
        +this.GeoPoint.toString()
        +"Description: "+this.Description+"\n";
  }

  //
//  factory Vehicle.fromJson(Map<String, dynamic> json) {
//    print("factory Vehicles");
//    print(json.toString());
//
//    Geopoint gp;
//
//    gp.Latitude = 0.1;
//    gp.Longitude = 0.2;
//
//    Vehicle v = Vehicle(
//        DocId: "a",
//        Name: "a",
//        Type: "a",
//        Status: "a",
//        ParkingLot: "",
//        GeoPoint: gp,
//        Description: "");
//
//    List<Vehicle> lv;
//    lv.add(v);
//
//
//
//    return v;
//  }
}



class MasterDataResponse {
//  final List<Vehicles>{};
  final List<dynamic> MasterData;

  MasterDataResponse({this.MasterData});

  factory MasterDataResponse.fromJson(List<dynamic> json) {
    print("types.dart MasterDataResponse:");
    print(json.toString());

    return MasterDataResponse(
      MasterData: json,
    );
  }
}

//factory TranslationResponse.fromJson(Map<String, dynamic> json) {
//print("factory TranslationResponse");
//print(json.toString());
//
//print("####");
//print(translator.toJson());
//print("####");
//
//translationDisplay.taskId = json['taskId'];
//translationDisplay.sourceLanguage = translator.sourceLanguage;
//translationDisplay.sourceText = translator.text;
//translationDisplay.targetLanguage = translator.targetLanguage;
//translationDisplay.targetText = json['translatedText'];
//
//translator.sourceLanguage = translator.targetLanguage;
//
//return TranslationResponse(
//taskId: json['taskId'],
//translatedText: json['translatedText'],
//loadCommands: json['loadCommands'].cast<String>(),
//);
//
//
//
//
//factory TranslationResponse.error(String description) {
//print("factory TranslationResponse error");
//print(description);
//return TranslationResponse(
//taskId: "error",
//translatedText: description,
//loadCommands: null,
//);
//}

//DocId       string         `firestore:"doc-id"`
//Name        string         `firestore:"name"`
//Type        string         `firestore:"type"`
//Status      string         `firestore:"status"`
//ParkingLot  string         `firestore:"parking-lot"`
//GeoPoint    *latlng.LatLng `firestore:"geopoint"`
//Description string         `firestore:"description"`
