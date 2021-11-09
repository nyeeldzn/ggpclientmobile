import 'dart:convert';

class ListaRuptura {

  final int id;
  final String desc;
  final String date;
  List product_list = [];

  ListaRuptura(this.id, this.desc, this.date);

  String toJson(ListaRuptura listaRuptura) {
    String json = jsonEncode(
        {
          "id": listaRuptura,
          "desc": listaRuptura.desc,
          "date": listaRuptura.date,
          "product_list": listaRuptura.product_list
        }
    );
    return json;
  }

  @override
  String toString() {
    return 'ListaRuptura{id: $id, desc: $desc, date: $date, product_list: $product_list}';
  }
}