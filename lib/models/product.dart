class Product {

  int id;
  String name;

  Product ({
    required this.id,
    required this.name
  });

  @override
  String toString() {
    return 'Product{id: $id, name: $name}';
  }
}