import 'package:ggpmobile/models/lista_ruptura.dart';
import 'package:ggpmobile/models/product.dart';

class RupturaProduto {

  final int id;
  final ListaRuptura lista_ruptura;
  final Product product;

  RupturaProduto(this.id, this.lista_ruptura, this.product);

  @override
  String toString() {
    return 'RupturaProduto{id: $id, lista_ruptura: $lista_ruptura, product: $product}';
  }
}