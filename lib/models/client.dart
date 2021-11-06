import 'package:ggpmobile/models/bairro.dart';

class Client {

  final int id;
  final String name;
  final Bairro bairro;
  final String tel;
  final String data_cadastro;

  Client({
    required this.id,
    required this.name,
    required this.bairro,
    required this.tel,
    required this.data_cadastro
  });

  @override
  String toString() {
    return 'Client{id: $id, name: $name, bairro: $bairro, tel: $tel, data_cadastro: $data_cadastro}';
  }
}