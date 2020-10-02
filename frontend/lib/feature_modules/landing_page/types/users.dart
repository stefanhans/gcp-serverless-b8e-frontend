
class User {
  String DocId;
  String Name;
  String Type;
  String Status;
  String Description;

  User(
      {String DocId,
        String Name,
        String Type,
        String Status,
        String Description}) {
    this.DocId = DocId;
    this.Name = Name;
    this.Type = Type;
    this.Status = Status;
    this.Description = Description;
  }

  factory User.fromJson(Map<String, dynamic> jsonMap) {
    print("types.dart User.fromJson:");
    print(jsonMap.toString());

    return User(
      DocId: jsonMap["DocId"],
      Name: jsonMap["Name"],
      Type: jsonMap["Type"],
      Status: jsonMap["Status"],
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
        "\"Description\": " +
        "\"" +
        this.Description +
        "\"" +
        "}";
  }
}
