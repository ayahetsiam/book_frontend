class AuthorModel {
  String name;
  String firstname;

  AuthorModel({
    required this.name,
    required this.firstname,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json["name"] as String,
      firstname: json["firstname"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "firstname": firstname,
    };
  }
}
