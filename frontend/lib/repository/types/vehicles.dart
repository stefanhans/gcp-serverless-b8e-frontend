class Vehicle {
  String docId;
  String name;
  String type;
  String status;
  String parkingLot;
  GeoPoint geoPoint;
  String description;

  Vehicle(
      {String docId,
      String name,
      String type,
      String status,
      String parkingLot,
      GeoPoint geoPoint,
      String description}) {
    this.docId = docId;
    this.name = name;
    this.type = type;
    this.status = status;
    this.parkingLot = parkingLot;
    this.geoPoint = geoPoint;
    this.description = description;
  }

  factory Vehicle.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart Vehicle.fromJson:");
    print(jsonMap.toString());

    GeoPoint _geopoint = new GeoPoint();
    _geopoint.latitude =
        double.tryParse(jsonMap["GeoPoint"]["latitude"].toString());
    _geopoint.longitude =
        double.tryParse(jsonMap["GeoPoint"]["longitude"].toString());

    return Vehicle(
      docId: jsonMap["DocId"],
      name: jsonMap["Name"],
      type: jsonMap["Type"],
      status: jsonMap["Status"],
      parkingLot: jsonMap["ParkingLot"],
      geoPoint: _geopoint,
      description: jsonMap["Description"],
    );
  }

  String toJson() {
    return "{" +
        "\"DocId\": " +
        "\"" +
        this.docId +
        "\"" +
        "," +
        "\"Name\": " +
        "\"" +
        this.name +
        "\"" +
        "," +
        "\"Type\": " +
        "\"" +
        this.type +
        "\"" +
        "," +
        "\"Status\": " +
        "\"" +
        this.status +
        "\"" +
        "," +
        "\"ParkingLot\": " +
        "\"" +
        this.parkingLot +
        "\"" +
        "," +
        "\"GeoPoint\": " +
        this.geoPoint.toJson() +
        ",\"Description\": " +
        "\"" +
        this.description +
        "\"" +
        "}";
  }
}

class GeoPoint {
  double latitude;
  double longitude;

  GeoPoint({double latitude, double longitude}) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  factory GeoPoint.fromJson(Map<String, dynamic> json) {
    print("types.dart GeoPoint:");
    print(json.toString());

    return GeoPoint(
        latitude: double.parse(json["latitude"].toString()),
        longitude: double.parse(json["longitude"].toString()));
  }

  String toJson() {
    return "{" +
        "\"latitude\": " +
        this.latitude.toString() +
        ","
            "\"longitude\": " +
        this.longitude.toString() +
        "}";
  }
}
