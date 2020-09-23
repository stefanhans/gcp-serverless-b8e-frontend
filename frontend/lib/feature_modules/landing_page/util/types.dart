import 'dart:convert';

class MasterData {
  List<Vehicle> vehicles;

  MasterData({this.vehicles});

  factory MasterData.fromJson(List<dynamic> jsonList) {
    print("types.dart MasterData.fromJson:");

    List<Vehicle> _vehicles = new List<Vehicle>();
    for (var vehicle in jsonList) {
      _vehicles.add(Vehicle.fromJson(vehicle));
    }

    return MasterData(
      vehicles: _vehicles,
    );
  }


  Map<String, dynamic> toJson() => {
    'vehicles': vehicles,
  };
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

  factory Vehicle.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart Vehicle.fromJson:");
    print(jsonMap.toString());

    return Vehicle(
      DocId: jsonMap["DocId"],
      Name: jsonMap["Name"],
      Type: jsonMap["Type"],
      Status: jsonMap["Status"],
      ParkingLot: jsonMap["ParkingLot"],
      GeoPoint: Geopoint.fromJson(json.decode(jsonMap["GeoPoint"]
          .toString()
          .replaceAll("latitude", "\"latitude\"")
          .replaceAll("longitude", "\"longitude\""))),
      Description: jsonMap["Description"],
    );
  }


  Map<String, dynamic> toJson() => {
    'DocId': DocId,
    'Name': Name,
    'Type': Type,
    'Status': Status,
    'ParkingLot': ParkingLot,
    'GeoPoint': GeoPoint,
    'Description': Description,
  };

  String toString() {
    return "Vehicle:\n" +
        "DocId: " +
        this.DocId +
        "\n" +
        "Name: " +
        this.Name +
        "\n" +
        "Type: " +
        this.Type +
        "\n" +
        "Status: " +
        this.Status +
        "\n" +
        "ParkingLot: " +
        this.ParkingLot +
        "\n" +
        this.GeoPoint.toString() +
        "Description: " +
        this.Description +
        "\n";
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

  Map<String, dynamic> toJson() => {
        'latitude': Latitude,
        'longitude': Longitude,
      };

  String toString() {
    return "Geopoint:\n" +
        "\tlatitude: " +
        this.Latitude.toString() +
        "\n" +
        "\tlongitude: " +
        this.Longitude.toString() +
        "\n";
  }
}
