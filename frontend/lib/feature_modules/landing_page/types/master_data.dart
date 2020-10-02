import 'package:gpc_frontend/feature_modules/landing_page/types/types.dart';

class MasterData {
  List<User> users;
  List<Vehicle> vehicles;
  List<Booking> bookings;
  DateTime from;
  DateTime to;
  String status;
  DateTime statusTime;

  MasterData(
      {List<User> users,
      List<Vehicle> vehicles,
      List<Booking> bookings,
      DateTime from,
      DateTime to,
      String status,
      DateTime statusTime}) {
    this.users = users;
    this.vehicles = vehicles;
    this.bookings = bookings;
    this.from = from;
    this.to = to;
    this.status = status;
    this.statusTime = statusTime;
  }

  factory MasterData.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart MasterData.fromJson:");

    List<User> _users = new List<User>();
    for (var _user in jsonMap["MasterData"]["Users"]) {
      _users.add(User.fromJson(_user));
    }

    List<Vehicle> _vehicles = new List<Vehicle>();
    for (var _vehicle in jsonMap["MasterData"]["Vehicles"]) {
      _vehicles.add(Vehicle.fromJson(_vehicle));
    }

    List<Booking> _bookings = new List<Booking>();
    for (var _booking in jsonMap["MasterData"]["Bookings"]) {
      _bookings.add(Booking.fromJson(_booking));
    }

    DateTime _from;
    if (DateTime.tryParse(
            jsonMap["MasterData"]["From"] ?? "1970-01-01 00:00:00Z") ==
        null) {
      _from = DateTime.parse("1970-01-01 00:00:00Z");
    } else {
      _from = DateTime.tryParse(jsonMap["MasterData"]["From"]);
    }

    DateTime _to;
    if (DateTime.tryParse(
            jsonMap["MasterData"]["To"] ?? "1970-01-01 00:00:00Z") ==
        null) {
      _to = DateTime.parse("1970-01-01 00:00:00Z");
    } else {
      _to = DateTime.tryParse(jsonMap["MasterData"]["To"]);
    }

    DateTime _statusTime;
    if (DateTime.tryParse(
            jsonMap["MasterData"]["StatusTime"] ?? "1970-01-01 00:00:00Z") ==
        null) {
      _statusTime = DateTime.parse("1970-01-01 00:00:00Z");
    } else {
      _statusTime = DateTime.tryParse(jsonMap["MasterData"]["StatusTime"]);
    }

    return MasterData(
      users: _users,
      vehicles: _vehicles,
      bookings: _bookings,
      from: _from,
      to: _to,
      status: jsonMap["MasterData"]["Status"],
      statusTime: _statusTime,
    );
  }

  List<User> usersFromJson(Map<String, dynamic> jsonMap) {
    print("types.dart usersFromJson:");

    List<User> _users = new List<User>();
    for (var _user in jsonMap["MasterData"]["Users"]) {
      _users.add(User.fromJson(_user));
    }
    return _users;
  }

  String usersToJson() {
    String jsonUsers = "";
    for (var i = 0; i < users.length - 1; i++) {
      jsonUsers += users[i].toJson() + ",";
    }
    jsonUsers += users[users.length - 1].toJson();

    return "[" + jsonUsers + "]";
  }

  String toJson() {
    String jsonUsers = "";
    for (var i = 0; i < users.length - 1; i++) {
      jsonUsers += users[i].toJson() + ",";
    }
    jsonUsers += users[users.length - 1].toJson();

    String jsonVehicles = "";
    for (var i = 0; i < vehicles.length - 1; i++) {
      jsonVehicles += vehicles[i].toJson() + ",";
    }
    jsonVehicles += vehicles[vehicles.length - 1].toJson();

    String jsonBookings = "";
    for (var i = 0; i < bookings.length - 1; i++) {
      jsonBookings += bookings[i].toJson() + ",";
    }
    jsonBookings += bookings[bookings.length - 1].toJson();

    return "{ \"MasterData\": {" +
        "\"Users\":" +
        "[" +
        jsonUsers +
        "]" +
        "," +
        "\"Vehicles\":" +
        "[" +
        jsonVehicles +
        "]" +
        "," +
        "\"Bookings\":" +
        "[" +
        jsonBookings +
        "]" +
        "," +
        "\"From\":" +
        "\"" +
        this.from.toIso8601String() +
        "\"" +
        "," +
        "\"To\":" +
        "\"" +
        this.to.toIso8601String() +
        "\"" +
        "," +
        "\"Status\":" +
        "\"" +
        this.status +
        "\"" +
        "," +
        "\"StatusTime\":" +
        "\"" +
        this.statusTime.toIso8601String() +
        "\"" +
        "} }";
  }
}
