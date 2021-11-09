import 'dart:convert';

import 'package:ggpmobile/models/lista_ruptura.dart';
import 'package:ggpmobile/models/product.dart';

class RupturaProduto {

  final int id;
  final ListaRuptura lista_ruptura;
  final Product product;

  RupturaProduto(this.id, this.lista_ruptura, this.product);

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