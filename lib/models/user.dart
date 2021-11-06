class User {

  final int id;
  final String username;
  final String priv;

  User({
    required this.id,
    required this.username,
    required this.priv,
});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      username: json['username'],
      priv: json['priv']
    );
  }

}