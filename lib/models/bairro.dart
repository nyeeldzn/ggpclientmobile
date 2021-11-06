class Bairro {

  final int id;
  final String name;

  Bairro({
    required this.id,
    required this.name
  });

  @override
  String toString() {
    return 'Bairro{id: $id, name: $name}';
  }
}