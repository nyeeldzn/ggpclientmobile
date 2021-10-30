import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Center(child: Text("LoginPage")),
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset('assets/back.png'),
        onPressed: (){
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/search.png'),
          onPressed: (){},
        ),
        IconButton(
          icon: Image.asset('assets/shopping-cart.png'),
          onPressed: (){ },
        ),
        SizedBox(height: 15),
      ],
    );
  }
}



