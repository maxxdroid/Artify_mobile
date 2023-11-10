class User {
  String? id;
  String? name;
  String? email;
  String ? password;
  String? phoneNumber;
  String? image;
  String? username;

  User({this.id, this.name, this.phoneNumber, this.image, this.email, this.password, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json["User Id"];
    name = json["username"];
    phoneNumber = json["Phone Number"];
    password = json["password"];
    image = json["Image Url"];
    email = json["email"];
    username = json["username"];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["User Id"] = id;
    data["username"] = name;
    data["Phone Number"] = phoneNumber;
    data["Image Url"] = image;
    data["email"] = email;
    data["password"] = password;
    data["username"] = username;
    return data;
  }
}

//Create User
