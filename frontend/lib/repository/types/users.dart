
class User {
  String docId;
  String name;
  String type;
  String status;
  String description;

  User(
      {String docId,
        String name,
        String type,
        String status,
        String description}) {
    this.docId = docId;
    this.name = name;
    this.type = type;
    this.status = status;
    this.description = description;
  }

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart User.fromJson:");
    print(jsonMap.toString());

    return User(
      docId: jsonMap["DocId"],
      name: jsonMap["Name"],
      type: jsonMap["Type"],
      status: jsonMap["Status"],
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
        "\"Description\": " +
        "\"" +
        this.description +
        "\"" +
        "}";
  }
}
