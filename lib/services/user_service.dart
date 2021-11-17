import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/user.dart';
import 'package:http/http.dart';

class UserService {

  //BASIC CRUD

  Future<List<User>> getAll() async {
    Response response = await DefaultRequest().getObject("/usuarios");
    Iterable l = json.decode(response.body);
    return List<User>.from(l.map((model) => User.fromJson(model)));
  }

  Future<User> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/usuarios", id);
    print(response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> getByUsername(String username) async{
    username = username.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/usuarios/buscaPorNome/$username");
    print("Json retornado: " + response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> postUser(User user) async {
    String json = User.toJson(user);
    Response response = await DefaultRequest().postObject(json, "/usuarios");
    print("Json retornado: " + response.body);
    return User.fromJson(jsonDecode(response.body));
  }


  Future<User> updateUser(User user) async {
    String json = User.toJson(user);
    Response response = await DefaultRequest().updateObject(json, "/usuarios", user.id);
    print("Json retornado: " + response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteUser(int id) async {
    Response response = await DefaultRequest().deleteObject("/usuarios", id);
    print("Json retornado: " + response.body);
    switch(response.statusCode){
      case 200:
        return true;
      default:
        return false;
    }

  }


}