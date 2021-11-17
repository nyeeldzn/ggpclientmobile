import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/lista_ruptura.dart';
import 'package:http/http.dart';

class ListaRupturaService {

  //BASIC CRUD

  Future<List<ListaRuptura>> getAll() async {
    Response response = await DefaultRequest().getObject("/produtos");
    Iterable l = json.decode(response.body);
    return List<ListaRuptura>.from(l.map((model) => ListaRuptura.fromJson(model)));
  }

  Future<ListaRuptura> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/produtos", id);
    print(response.body);
    return ListaRuptura.fromJson(jsonDecode(response.body));
  }

  Future<ListaRuptura> getByListaRupturaname(String ListaRupturaName) async{
    ListaRupturaName = ListaRupturaName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/produtos/buscaPorNome/$ListaRupturaName");
    print("Json retornado: " + response.body);
    return ListaRuptura.fromJson(jsonDecode(response.body));
  }

  Future<ListaRuptura> postListaRuptura(ListaRuptura listaRuptura) async {
    String json = ListaRuptura.toJson(listaRuptura);
    Response response = await DefaultRequest().postObject(json, "/produtos");
    print("Json retornado: " + response.body);
    return ListaRuptura.fromJson(jsonDecode(response.body));
  }


  Future<ListaRuptura> updateListaRuptura(ListaRuptura listaRuptura) async {
    String json = ListaRuptura.toJson(listaRuptura);
    Response response = await DefaultRequest().updateObject(json, "/produtos", listaRuptura.id);
    print("Json retornado: " + response.body);
    return ListaRuptura.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteListaRuptura(int id) async {
    Response response = await DefaultRequest().deleteObject("/produtos", id);
    print("Json retornado: " + response.body);
    switch(response.statusCode){
      case 200:
        return true;
      default:
        return false;
    }

  }


}