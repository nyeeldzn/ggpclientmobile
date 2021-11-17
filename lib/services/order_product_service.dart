import 'dart:convert';
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';
import 'package:ggpmobile/models/order_product.dart';
import 'package:http/http.dart';

class OrderProductService {

  //BASIC CRUD

  Future<List<OrderProduct>> getAll() async {
    Response response = await DefaultRequest().getObject("/orderProduct");
    Iterable l = json.decode(response.body);
    return List<OrderProduct>.from(l.map((model) => OrderProduct.fromJson(model)));
  }

  Future<OrderProduct> getById(int id) async{
    Response response = await DefaultRequest().getObjectWithId("/orderProduct", id);
    print(response.body);
    return OrderProduct.fromJson(jsonDecode(response.body));
  }

  Future<OrderProduct> getByOrderProductName(String orderProductName) async{
    orderProductName = orderProductName.toUpperCase();
    Response response = await DefaultRequest().getObjectWithText("/orderProduct/buscaPorNome/$orderProductName");
    print("Json retornado: " + response.body);
    return OrderProduct.fromJson(jsonDecode(response.body));
  }

  Future<OrderProduct> postOrderProduct(OrderProduct orderProduct) async {
    String json = orderProduct.toJson(orderProduct);
    Response response = await DefaultRequest().postObject(json, "/orderProduct");
    print("Json retornado: " + response.body);
    return OrderProduct.fromJson(jsonDecode(response.body));
  }


  Future<OrderProduct> updateOrderProduct(OrderProduct orderProduct) async {
    String json = orderProduct.toJson(orderProduct);
    Response response = await DefaultRequest().updateObject(json, "/orderProduct", orderProduct.id);
    print("Json retornado: " + response.body);
    return OrderProduct.fromJson(jsonDecode(response.body));
  }

  Future<bool> deleteOrderProduct(int id) async {
    Response response = await DefaultRequest().deleteObject("/orderProduct", id);
    print("Json retornado: " + response.body);
    switch(response.statusCode){
      case 200:
        return true;
      default:
        return false;
    }

  }


}