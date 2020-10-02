// Validate JSON https://jsonlint.com/

class Booking {
  String DocId;
  String User;
  String Vehicle;
  String VehicleType;
  String VehicleStatus;
  String ParkingLot;
  DateTime From;
  DateTime To;
  String Status;
  DateTime StatusTime;

  Booking(
      {String DocId,
      String User,
      String Vehicle,
      String VehicleType,
      String VehicleStatus,
      String ParkingLot,
      DateTime From,
      DateTime To,
      String Status,
      DateTime StatusTime}) {
    this.DocId = DocId;
    this.User = User;
    this.Vehicle = Vehicle;
    this.VehicleType = VehicleType;
    this.VehicleStatus = VehicleStatus;
    this.ParkingLot = ParkingLot;
    this.From = From;
    this.To = To;
    this.Status = Status;
    this.StatusTime = StatusTime;
  }

  // "DocId": "ZbAvWNPqKBrVCPcexz1Y",
  // "User": "Alice",
  // "Vehicle": "Tesla Deluxe",
  // "VehicleType": "eCar",
  // "VehicleStatus": "ready",
  // "ParkingLot": "Joe's Garage",
  // "From": "2020-09-19T15:05:48.212968Z",
  // "To": "2020-09-19T17:05:48.212968Z",
  // "Status": "request",
  // "StatusTime": "2020-09-19T15:05:48.212968Z"

  factory Booking.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart Booking.fromJson:");
    print(jsonMap.toString());

    var from = DateTime.parse(jsonMap["From"]); // jsonMap["From"]
    print("XXXX: " + jsonMap["From"]);
    print("XXXX: " + from.toIso8601String());

    return Booking(
      DocId: jsonMap["DocId"],
      User: jsonMap["User"],
      Vehicle: jsonMap["Vehicle"],
      VehicleType: jsonMap["VehicleType"],
      VehicleStatus: jsonMap["VehicleStatus"],
      ParkingLot: jsonMap["ParkingLot"],
      From: DateTime.parse(jsonMap["From"]),
      To: DateTime.parse(jsonMap["To"]),
      Status: jsonMap["Status"],
      StatusTime: DateTime.parse(jsonMap["StatusTime"]),
    );
  }

  String toJson() {
    return "{" +
        "\"DocId\": " +
        "\"" +
        this.DocId +
        "\"" +
        "," +
        "\"User\": " +
        "\"" +
        this.User +
        "\"" +
        "," +
        "\"Vehicle\": " +
        "\"" +
        this.Vehicle +
        "\"" +
        "," +
        "\"VehicleType\": " +
        "\"" +
        this.VehicleType +
        "\"" +
        "," +
        "\"VehicleStatus\": " +
        "\"" +
        this.VehicleStatus +
        "\"" +
        "," +
        "\"ParkingLot\": " +
        "\"" +
        this.ParkingLot +
        "\"" +
        "," +
        "\"From\": " +
        "\"" +
        this.From.toIso8601String() +
        "\"" +
        "," +
        "\"To\": " +
        "\"" +
        this.To.toIso8601String() +
        "\"" +
        "," +
        "\"Status\": " +
        "\"" +
        this.Status +
        "\"" +
        "," +
        "\"StatusTime\": " +
        "\"" +
        this.StatusTime.toIso8601String() +
        "\"" +
        "}";
  }
}
