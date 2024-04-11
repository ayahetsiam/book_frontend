class AuthorModel {
  String id;
  String name;
  String firstname;

  AuthorModel({
    required this.id,
    required this.name,
    required this.firstname,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json["_id"] as String,
      name: json["name"] as String,
      firstname: json["firstName"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "firstName": firstname,
    };
  }
}
