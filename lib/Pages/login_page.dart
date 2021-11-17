import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggpmobile/Pages/home_page.dart';
import 'package:ggpmobile/helpers/HTTPRequest/login_request.dart';
import 'package:ggpmobile/models/product.dart';
import 'package:ggpmobile/models/user.dart';
import 'package:ggpmobile/services/product_service.dart';
import 'package:ggpmobile/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:ggpmobile/helpers/HTTPRequest/default_request.dart';


class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();


}



class _LoginPageState extends State<LoginPage>{
      final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
          String _username = "";
          String _pass = "";
          late BuildContext LoginPageContext;

  @override
  void initState() {
    Future<bool> state = testConnection();
    state.then((value) => {
    if(value){
        print("Conexao feita com sucesso")
    } else {
    print("Problema ao realizar conexao")
    }

    });



    super.initState();
  }

  Future<bool> testConnection() async {
    bool state = await DefaultRequest().setConn("http://192.168.0.101", "8081", "");
    return state;
  }


  @override
  Widget build(BuildContext context) {
    LoginPageContext = context;
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: _scaffoldKey,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Stack(children:<Widget> [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF398AE5),
                      Colors.white,
                    ],
                    stops: [0.8,1],
                  )
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      const Text("Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildUserTextField(),
                      const SizedBox(height: 15),
                      buildPassTextField(),
                      const SizedBox(height: 15),
                      buildLoginButton(),
                    ],
                  ),
                ),
              )
            ],),
          ),
        ),);
  }

  Column buildUserTextField() {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget> [
                        Text(
                          "Email",
                        style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                    ),
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Color(0xFF73AEF5),
                          ),
                          height: 60,
                            child: TextField(
                              onChanged: (val){
                                setState(() {
                                  _username = val.trim().toUpperCase();
                                });
                              },
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                              ),
                                hintText: "Digite seu Usuario",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                )
                              ),
                            ),
                        )
                      ]  ,
                    );
  }
  Column buildPassTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget> [
        Text(
          "Senha",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10.0,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF73AEF5),
          ),
          height: 60,
          child: TextField(
            onChanged: (val){
              setState(() {
                _pass = val.trim().toUpperCase();
              });
            },
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: "Digite sua Senha",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 10.0,
                )
            ),
          ),
        )
      ]  ,
    );
  }
  Container buildLoginButton() {
    int i = 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
            iniciarLogin(_username, _pass);
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        child: Text("ENTRAR",
          style: TextStyle(
            color:Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void iniciarLogin(String usuario, String pass) async {
    print("Iniciando Login");

    User usr = User(id: 0, username: _username, pass: _pass, priv: "");
    int state = await LoginRequest().login(usr);
    switch (state) {
      case 0:
        print("Problema de Conexao");
        break;
      case 1:
        print("Usuario Logado com Sucesso");
        navigateToHomePage(LoginPageContext);
        break;
      case 2:
        print("Usuario e/ou Senha Recusados");
        break;
    }
  }

  void navigateToHomePage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  Future<List<Product>> testGetAll(){
      print("Getting all");
    return ProductService().getAll();
  }
  Future<Product> testGetByName(Product productTest){
      print("Getting test by name");
    return ProductService().getByProductname(productTest.name);
  }
  Future<Product> testPost (Product product){
      print("Posting user teste");
      Future<Product> postProduct = ProductService().postProduct(product);
    return postProduct;
  }
  Future<Product> testPut (Product product) {
      print("Updating User teste");
      Future<Product> putProduct = ProductService().updateProduct(product);
    return putProduct;
  }
  Future<bool> testDelete (Product product) {
      print("deleting user teste");
      Future<bool> deleteProduct = ProductService().deleteProduct(product.id);
    return deleteProduct;
  }
  void iniciarTestesCrud(){
    Product prodToTest = Product(id: 3990022, name: "PRODUTO DE TESTE");
    Product prodToTest2 = Product(id: 87882910, name: "PRODUTO DE TEST");

    print("Iniciando Teste de Service");
    testGetAll().then((value) => {
        print(value),
        print("Iniciando Teste de Post"),
          testPost(prodToTest).then((value) => {
            print(value),
            print("Iniciando Teste de GetID"),
              testGetByName(prodToTest).then((value) => {
                print(value),
                prodToTest2 = value,
                print("Iniciando Teste de Put"),
                  testPut(prodToTest2).then((value) => {
                    print(value),
                    print("Iniciando Teste de Delete"),
                      testDelete(prodToTest2).then((value) => {
                        print(value),
                        print("Testes finalizados"),
                      })
                  })
              })
          })

    });
  }

}



