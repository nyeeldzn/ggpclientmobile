import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/product.dart';
import 'package:http/http.dart';

class ProductService {

  //BASIC CRUD

  Future<List<Product>> getAll() async {
    Response response = await DefaultRequest().getObject("/produtos");
    Iterable l = json.decode(response.body);
    return List<Product>.from(l.map((model) => Product.fromJson(model)));
  }

  Future<Product> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/produtos", id);
    print(response.body);
    return Product.fromJson(jsonDecode(response.body));
  }

  Future<Product> getByProductname(String productName) async{
    productName = productName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/produtos/buscaPorNome/$productName");
    print("Json retornado: " + response.body);
    return Product.fromJson(jsonDecode(response.body));
  }

  Future<Product> postProduct(Product product) async {
    String json = Product.toJson(product);
    Response response = await DefaultRequest().postObject(json, "/produtos");
    print("Json retornado: " + response.body);
    return Product.fromJson(jsonDecode(response.body));
  }


  Future<Product> updateProduct(Product product) async {
    String json = Product.toJson(product);
    Response response = await DefaultRequest().updateObject(json, "/produtos", product.id);
    print("Json retornado: " + response.body);
    return Product.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteProduct(int id) async {
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