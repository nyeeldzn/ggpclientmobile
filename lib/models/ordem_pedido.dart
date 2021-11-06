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

  OrdemPedido(
      this.id,
      this.client,
      this.employe,
      this.entregador,
      this.paymment_method,
      this.created_date,
      this.created_hour,
      this.start_hour,
      this.checkout_hour,
      this.sended_hour,
      this.end_hour,
      this.font,
      this.checkUser,
      this.status,
      this.order_products);

  @override
  String toString() {
    return 'OrdemPedido{id: $id, client: $client, employe: $employe, entregador: $entregador, paymment_method: $paymment_method, created_date: $created_date, created_hour: $created_hour, start_hour: $start_hour, checkout_hour: $checkout_hour, sended_hour: $sended_hour, end_hour: $end_hour, font: $font, checkUser: $checkUser, status: $status, order_products: $order_products}';
  }
}