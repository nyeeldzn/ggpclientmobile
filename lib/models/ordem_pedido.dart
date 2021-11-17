import 'dart:convert';

import 'package:ggpmobile/models/client.dart';
import 'package:ggpmobile/models/user.dart';

class OrdemPedido {

  final int id;
  final Client client;
  final User employe;
  final String entregador;
  final String paymment_method;
  final String created_date;
  final String created_hour;
  final String start_hour;
  final String checkout_hour;
  final String sended_hour;
  final String end_hour;
  final String font;
  final String checkUser;
  final int status;
  final List order_products;

  OrdemPedido({
    required this.id,
    required this.client,
    required this.employe,
    required this.entregador,
    required this.paymment_method,
    required this.created_date,
    required this.created_hour,
    required this.start_hour,
    required this.checkout_hour,
    required this.sended_hour,
    required this.end_hour,
    required this.font,
    required this.checkUser,
    required this.status,
    required this.order_products
});

  factory OrdemPedido.fromJson(Map<String, dynamic> json){
    return OrdemPedido(
        id: json['id'],
        client: Client.fromJson(json['cliente']),
        employe: User.fromJson(json['operador']),
        entregador: json['entregador'],
        paymment_method: json['forma_pagamento'],
        created_date: json['entradaDate'],
        created_hour: json['entradaHora'],
        start_hour: json['triagemHora'],
        checkout_hour: json['checkoutHora'],
        sended_hour: json['enviadoHora'],
        end_hour: json['finalizadoHora'],
        font: json['fonte_pedido'],
        checkUser: json['caixa_responsavel'],
        status: json['status'],
        order_products: json['orderProducts'],
    );
  }

  String toJson(OrdemPedido product) {
    String json = jsonEncode(
        {
          'id': product.id,
          'cliente': product.client,
          'operador': product.employe,
          'entregador': product.entregador,
          'forma_pagamento': product.paymment_method,
          'entradaDate': product.created_date,
          'entradaHora': product.created_hour,
          'triagemHora': product.start_hour,
          'checkoutHora': product.checkout_hour,
          'enviadoHora': product.sended_hour,
          'finalizadoHora': product.end_hour,
          'fonte_pedido': product.font,
          'caixa_responsavel': product.checkUser,
          'status': product.status,
          'orderProducts': product.order_products,
        }
    );
    return json;
  }



  @override
  String toString() {
    return 'OrdemPedido{id: $id, client: $client, employe: $employe, entregador: $entregador, paymment_method: $paymment_method, created_date: $created_date, created_hour: $created_hour, start_hour: $start_hour, checkout_hour: $checkout_hour, sended_hour: $sended_hour, end_hour: $end_hour, font: $font, checkUser: $checkUser, status: $status, order_products: $order_products}';
  }
}