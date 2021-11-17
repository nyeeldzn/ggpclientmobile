import 'dart:convert';

class ListaRuptura {

  final int id;
  final String desc;
  final String date;
  List product_list = [];

  ListaRuptura({required this.id, required this.desc, required this.date, required this.product_list});

  factory ListaRuptura.fromJson(Map<String, dynamic> json){
    return ListaRuptura(
        id: json['id'],
        desc: json['nome'],
        date: json['bairro'],
        product_list: json['tel']
    );
  }



  static String toJson(ListaRuptura listaRuptura) {
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