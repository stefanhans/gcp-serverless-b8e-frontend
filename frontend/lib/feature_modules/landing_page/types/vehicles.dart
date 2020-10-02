
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

  factory Vehicle.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart Vehicle.fromJson:");
    print(jsonMap.toString());


    Geopoint _geopoint = new Geopoint();
    _geopoint.Latitude = double.tryParse(jsonMap["GeoPoint"]["latitude"].toString());
    _geopoint.Longitude = double.tryParse(jsonMap["GeoPoint"]["longitude"].toString());

    // Geopoint.fromJson(json.decode(jsonMap["GeoPoint"]
    //     .toString()
    //     .replaceAll("latitude", "\"latitude\"")
    //     .replaceAll("longitude", "\"longitude\"")))

    return Vehicle(
      DocId: jsonMap["DocId"],
      Name: jsonMap["Name"],
      Type: jsonMap["Type"],
      Status: jsonMap["Status"],
      ParkingLot: jsonMap["ParkingLot"],
      GeoPoint: _geopoint,
      Description: jsonMap["Description"],
    );
  }

  String toJson() {
    return "{" +
        "\"DocId\": " +
        "\"" +
        this.DocId +
        "\"" +
        "," +
        "\"Name\": " +
        "\"" +
        this.Name +
        "\"" +
        "," +
        "\"Type\": " +
        "\"" +
        this.Type +
        "\"" +
        "," +
        "\"Status\": " +
        "\"" +
        this.Status +
        "\"" +
        "," +
        "\"ParkingLot\": " +
        "\"" +
        this.ParkingLot +
        "\"" +
        "," +
        "\"Geopoint\": " +
        this.GeoPoint.toJson() +
        ",\"Description\": " +
        "\"" +
        this.Description +
        "\"" +
        "}";
  }
}

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
        Longitude: double.parse(json["longitude"].toString()));
  }

  String toJson() {
    return "{" +
        "\"latitude\": " +
        this.Latitude.toString() +
        ","
            "\"longitude\": " +
        this.Longitude.toString() +
        "}";
  }
}
