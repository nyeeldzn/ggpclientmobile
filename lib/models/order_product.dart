import 'dart:convert';

import 'package:ggpmobile/models/ordem_pedido.dart';
import 'package:ggpmobile/models/product.dart';

class OrderProduct {

  final int id;
  final OrdemPedido pedido;
  final Product product;

  OrderProduct({
    required this.id,
    required this.pedido,
    required this.product
  });


  String toJson(OrderProduct orderProduct) {
    String json = jsonEncode(
        {
          "id": orderProduct.id,
          "pedido": orderProduct.pedido,
          "product": orderProduct.product
        }
    );
    return json;
  }


}