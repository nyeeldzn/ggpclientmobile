import 'dart:convert';

class Product {

  int id;
  String name;

  Product ({
    required this.id,
    required this.name
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
        id: json['id'],
        name: json['nome']
    );
  }

  String toJson(Product product) {
    String json = jsonEncode(
        {
          "id": product.id,
          "nome": product.name
        }
    );
    return json;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name}';
  }
}