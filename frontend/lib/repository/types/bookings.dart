// Validate JSON https://jsonlint.com/

class Booking {
  String docId;
  String user;
  String vehicle;
  String vehicleType;
  String vehicleStatus;
  String parkingLot;
  DateTime from;
  DateTime to;
  String status;
  DateTime statusTime;

  Booking(
      {String docId,
      String user,
      String vehicle,
      String vehicleType,
      String vehicleStatus,
      String parkingLot,
      DateTime from,
      DateTime to,
      String status,
      DateTime statusTime}) {
    this.docId = docId;
    this.user = user;
    this.vehicle = vehicle;
    this.vehicleType = vehicleType;
    this.vehicleStatus = vehicleStatus;
    this.parkingLot = parkingLot;
    this.from = from;
    this.to = to;
    this.status = status;
    this.statusTime = statusTime;
  }

  factory Booking.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart Booking.fromJson:");
    print(jsonMap.toString());

    var from = DateTime.parse(jsonMap["From"]); // jsonMap["From"]
    print("XXXX: " + jsonMap["From"]);
    print("XXXX: " + from.toIso8601String());

    return Booking(
      docId: jsonMap["DocId"],
      user: jsonMap["User"],
      vehicle: jsonMap["Vehicle"],
      vehicleType: jsonMap["VehicleType"],
      vehicleStatus: jsonMap["VehicleStatus"],
      parkingLot: jsonMap["ParkingLot"],
      from: DateTime.parse(jsonMap["From"]),
      to: DateTime.parse(jsonMap["To"]),
      status: jsonMap["Status"],
      statusTime: DateTime.parse(jsonMap["StatusTime"]),
    );
  }

  String toJson() {
    return "{" +
        "\"DocId\": " +
        "\"" +
        this.docId +
        "\"" +
        "," +
        "\"User\": " +
        "\"" +
        this.user +
        "\"" +
        "," +
        "\"Vehicle\": " +
        "\"" +
        this.vehicle +
        "\"" +
        "," +
        "\"VehicleType\": " +
        "\"" +
        this.vehicleType +
        "\"" +
        "," +
        "\"VehicleStatus\": " +
        "\"" +
        this.vehicleStatus +
        "\"" +
        "," +
        "\"ParkingLot\": " +
        "\"" +
        this.parkingLot +
        "\"" +
        "," +
        "\"From\": " +
        "\"" +
        this.from.toIso8601String() +
        "\"" +
        "," +
        "\"To\": " +
        "\"" +
        this.to.toIso8601String() +
        "\"" +
        "," +
        "\"Status\": " +
        "\"" +
        this.status +
        "\"" +
        "," +
        "\"StatusTime\": " +
        "\"" +
        this.statusTime.toIso8601String() +
        "\"" +
        "}";
  }
}
