import 'dart:convert';

import 'package:ggpmobile/models/lista_ruptura.dart';
import 'package:ggpmobile/models/product.dart';

class RupturaProduto {

  final int id;
  final ListaRuptura lista_ruptura;
  final Product product;

  RupturaProduto({
    required this.id,
    required this.lista_ruptura,
    required this.product});

  factory RupturaProduto.fromJson(Map<String, dynamic> json){
    return RupturaProduto(
        id: json['id'],
        lista_ruptura: json['lista_ruptura'],
        product: json['produto']
    );
  }

  String toJson(RupturaProduto rupturaProduto) {
    String json = jsonEncode(
        {
          "id": rupturaProduto.id,
          "lista_ruptura": rupturaProduto.lista_ruptura,
          "product": rupturaProduto.product
        }
    );
    return json;
  }

  @override
  String toString() {
    return 'RupturaProduto{id: $id, lista_ruptura: $lista_ruptura, product: $product}';
  }
}