import 'package:flutter/material.dart';
import 'package:ggpmobile/helpers/HTTPRequest/login_request.dart';
import 'package:ggpmobile/models/ordem_pedido.dart';
import 'package:ggpmobile/models/user.dart';
import 'package:ggpmobile/services/ordem_pedido_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<OrdemPedido> pedidos = [];


  @override
  void initState() {
    OrdemPedidoService().getAll().then((value) => {
      setState(() {
        pedidos = value;
      })
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = LoginRequest.currentUser;

    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: pedidos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        print("OK: " + pedidos[index].id.toString());
                      });
                    },
                    child: _listCard(pedidos[index])
                );
              })
        ),
    );
  }

  Widget _listCard(OrdemPedido pedido){
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: _boxDecorationFromStatus(pedido.status),
          child: ListTile(
            title: Text(pedido.client.name),
            subtitle: Text(pedido.created_hour),
            leading: _iconFromStatus(pedido.status),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ),
    );
  }
    BoxDecoration _boxDecorationFromStatus(int status){
    BoxDecoration box = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [

            Color(0xff9c9c9c),
            Color(0xff9c9c9c),
          ],
        ),
        border: Border.all(
            style: BorderStyle.solid, color: Colors.orange)
    );

    switch(status){
      case 1:
       box = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [

                Color(0xff9c9c9c),
                Color(0xff9c9c9c),
              ],
            ),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.orange)
        );
        break;
      case 2:
        box = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffebe35b),
                Color(0xff9c9c9c)
              ],
            ),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.orange)
        );
        break;
      case 3:
        box = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [

                Color(0xffebe35b),
                Color(0xffebe35b),
              ],
            ),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.orange)
        );
        break;
      case 4:
        box = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff7deb5b),
                Color(0xffebe35b)
              ],
            ),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.orange)
        );
        break;
      case 5:
        box = BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [

                Color(0xff7deb5b),
                Color(0xff7deb5b),
              ],
            ),
            border: Border.all(
                style: BorderStyle.solid, color: Colors.orange)
        );
        break;
    };

    return box;
  }
    Widget _iconFromStatus(int status) {
    Icon icon = Icon(Icons.archive);
    switch(status){
      case 1:
        icon = Icon(Icons.archive);
        break;
      case 2:
        icon = Icon(Icons.shopping_cart);
        break;
      case 3:
        icon = Icon(Icons.payments);
        break;
      case 4:
        icon = Icon(Icons.motorcycle_sharp);
        break;
      case 5:
        icon = Icon(Icons.check);
        break;
    };

    return icon;
  }

}
