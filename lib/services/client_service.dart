import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/Client.dart' as cli;
import 'package:http/http.dart';

class ClientService {

  //BASIC CRUD

  Future<List<cli.Client>> getAll() async {
    Response response = await DefaultRequest().getObject("/clientes");
    Iterable l = json.decode(response.body);
    return List<cli.Client>.from(l.map((model) => cli.Client.fromJson(model)));
  }

  Future<cli.Client> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/clientes", id);
    print(response.body);
    return cli.Client.fromJson(jsonDecode(response.body));
  }

  Future<cli.Client> getByclientName(String clientName) async{
    clientName = clientName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/clientes/buscaPorNome/$clientName");
    print("Json retornado: " + response.body);
    return cli.Client.fromJson(jsonDecode(response.body));
  }

  Future<cli.Client> postClient(cli.Client client) async {
    String json = cli.Client.toJson(client);
    Response response = await DefaultRequest().postObject(json, "/clientes");
    print("Json retornado: " + response.body);
    return cli.Client.fromJson(jsonDecode(response.body));
  }


  Future<cli.Client> updateClient(cli.Client client) async {
    String json = cli.Client.toJson(client);
    Response response = await DefaultRequest().updateObject(json, "/clientes", client.id);
    print("Json retornado: " + response.body);
    return cli.Client.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteClient(int id) async {
    Response response = await DefaultRequest().deleteObject("/clientes", id);
    print("Json retornado: " + response.body);
    switch(response.statusCode){
      case 200:
        return true;
      default:
        return false;
    }

  }


}