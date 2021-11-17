import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/ruptura_produto.dart';
import 'package:http/http.dart';

class RupturaProdutoService {

  //BASIC CRUD

  Future<List<RupturaProduto>> getAll() async {
    Response response = await DefaultRequest().getObject("/produtos");
    Iterable l = json.decode(response.body);
    return List<RupturaProduto>.from(l.map((model) => RupturaProduto.fromJson(model)));
  }

  Future<RupturaProduto> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/produtos", id);
    print(response.body);
    return RupturaProduto.fromJson(jsonDecode(response.body));
  }

  Future<RupturaProduto> getByRupturaProdutoName(String rupturaProdutoName) async{
    rupturaProdutoName = rupturaProdutoName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/produtos/buscaPorNome/$rupturaProdutoName");
    print("Json retornado: " + response.body);
    return RupturaProduto.fromJson(jsonDecode(response.body));
  }

  Future<RupturaProduto> postRupturaProduto(RupturaProduto rupturaProduto) async {
    String json = rupturaProduto.toJson(rupturaProduto);
    Response response = await DefaultRequest().postObject(json, "/produtos");
    print("Json retornado: " + response.body);
    return RupturaProduto.fromJson(jsonDecode(response.body));
  }


  Future<RupturaProduto> updateRupturaProduto(RupturaProduto rupturaProduto) async {
    String json = rupturaProduto.toJson(rupturaProduto);
    Response response = await DefaultRequest().updateObject(json, "/produtos", rupturaProduto.id);
    print("Json retornado: " + response.body);
    return RupturaProduto.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteRupturaProduto(int id) async {
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