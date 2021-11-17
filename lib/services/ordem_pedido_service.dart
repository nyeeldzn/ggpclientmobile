import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/ordem_pedido.dart';
import 'package:http/http.dart';

class OrdemPedidoService {

  //BASIC CRUD

  Future<List<OrdemPedido>> getAll() async {
    Response response = await DefaultRequest().getObject("/pedidos");
    Iterable l = json.decode(response.body);
    return List<OrdemPedido>.from(l.map((model) => OrdemPedido.fromJson(model)));
  }

  Future<OrdemPedido> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/pedidos", id);
    print(response.body);
    return OrdemPedido.fromJson(jsonDecode(response.body));
  }

  Future<OrdemPedido> getByOrdemPedidoname(String ordemPedidoName) async{
    ordemPedidoName = ordemPedidoName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/pedidos/buscaPorNome/$ordemPedidoName");
    print("Json retornado: " + response.body);
    return OrdemPedido.fromJson(jsonDecode(response.body));
  }

  Future<OrdemPedido> postOrdemPedido(OrdemPedido ordemPedido) async {
    String json = ordemPedido.toJson(ordemPedido);
    Response response = await DefaultRequest().postObject(json, "/pedidos");
    print("Json retornado: " + response.body);
    return OrdemPedido.fromJson(jsonDecode(response.body));
  }


  Future<OrdemPedido> updateOrdemPedido(OrdemPedido ordemPedido) async {
    String json = ordemPedido.toJson(ordemPedido);
    Response response = await DefaultRequest().updateObject(json, "/pedidos", ordemPedido.id);
    print("Json retornado: " + response.body);
    return OrdemPedido.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteOrdemPedido(int id) async {
    Response response = await DefaultRequest().deleteObject("/pedidos", id);
    print("Json retornado: " + response.body);
    switch(response.statusCode){
      case 200:
        return true;
      default:
        return false;
    }

  }


}