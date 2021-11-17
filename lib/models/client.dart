import 'dart:convert';

import 'package:ggpmobile/models/bairro.dart';

class Client {

  final int id;
  final String name;
  final String endereco;
  final Bairro bairro;
  final String tel;
  final String data_cadastro;

  Client({
    required this.id,
    required this.name,
    required this.endereco,
    required this.bairro,
    required this.tel,
    required this.data_cadastro
  });

  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
        id: json['id'],
        name: json['nome'],
        endereco: json['endereco'],
        bairro: Bairro.fromJson(json['bairro']),
        tel: json['telefone'],
        data_cadastro: json['data_cadastro']
    );
  }

  static String toJson(Client client) {
    String json = jsonEncode(
        {
          "id": client.id,
          "nome": client.name,
          "bairro": client.bairro,
          "tel": client.tel,
          "data_cadastro": client.data_cadastro,
        }
    );
    return json;
  }


  @override
  String toString() {
    return 'Client{id: $id, name: $name, bairro: $bairro, tel: $tel, data_cadastro: $data_cadastro}';
  }
}