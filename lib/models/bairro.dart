class Bairro {

  final int id;
  final String name;

  Bairro({
    required this.id,
    required this.name
  });

  factory Bairro.fromJson(Map<String, dynamic> json){
    return Bairro(
        id: json['id'],
        name: json['nome']
    );
  }

  @override
  String toString() {
    return 'Bairro{id: $id, name: $name}';
  }
}