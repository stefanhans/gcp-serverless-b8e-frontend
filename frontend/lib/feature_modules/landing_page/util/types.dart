class Geopoint {
  double Latitude;
  double Longitude;

  Geopoint({double Latitude, double Longitude}) {
    this.Latitude = Latitude;
    this.Longitude = Longitude;
  }
}

class Vehicles {
  String DocId;
  String Name;
  String Type;
  String Status;
  String ParkingLot;
  Geopoint GeoPoint;
  String Description;

  Vehicles(
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

  //
  factory Vehicles.fromJson(List<Map<String, dynamic>> json) {
    print("factory Vehicles");
    print(json.toString());

    Geopoint gp;

    gp.Latitude = 0.1;
    gp.Longitude = 0.2;

    Vehicles v = Vehicles(
        DocId: "a",
        Name: "a",
        Type: "a",
        Status: "a",
        ParkingLot: "",
        GeoPoint: gp,
        Description: "");

    List<Vehicles> lv;
    lv.add(v);



    return v;
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
