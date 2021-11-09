import 'dart:convert';

class User {

  final int id;
  final String username;
  final String pass;
  final String priv;

  User({
    required this.id,
    required this.username,
    required this.pass,
    required this.priv
});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      username: json['username'],
      pass: json['pass'],
      priv: json['priv']
    );
  }

  String toJson(User user){
   String json = jsonEncode(
        {
          "id": user.id.toString(),
          "username": user.username,
          "pass": user.pass,
          "priv": user.priv
        }
    );
    return json;
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, priv: $priv}';
  }
}