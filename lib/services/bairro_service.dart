import 'dart:convert';

import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/bairro.dart';
import 'package:http/http.dart';

class BairroService {

  //BASIC CRUD

  Future<List<Bairro>> getAll() async {
    Response response = await DefaultRequest().getObject("/bairros");
    Iterable l = json.decode(response.body);
    return List<Bairro>.from(l.map((model) => Bairro.fromJson(model)));
  }

  Future<Bairro> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/bairros", id);
    return Bairro.fromJson(jsonDecode(response.body));
  }

  //post


  //update

  //delete


}