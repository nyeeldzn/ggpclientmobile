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
    return User.fromJson(jsonDecode(response.body));
  }

  Future<User> getByUsername(String username) async{
    username = username.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/usuarios/buscaPorNome/$username");
    print("Json retornado: " + response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  //post


  //update

  //delete


}