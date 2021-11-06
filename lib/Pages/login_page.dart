import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggpmobile/models/user.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
      String _usuario = "";
      String _pass = "";

  @override
  Widget build(BuildContext context) {
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
                                  _usuario = val.trim();
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
                _pass = val.trim();
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () {
          iniciarLogin(_usuario, _pass);
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

  void iniciarLogin(String usuario, String pass) {
    print("Iniciando Login");
    String stringConcCredential = _usuario.trim().toUpperCase() + ":" + _pass.trim().toUpperCase();
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encodedCredentials = stringToBase64.encode(stringConcCredential);
    print("Encoded Credentials: " + encodedCredentials);

    fetchUser(encodedCredentials);
    //print(fetchUser(encodedCredentials));
  }

  /*
  Future<List<User>?> findUsers(String credentials) async {
    print("Realizando HttpRequest");
   // final response = await http.get(
   //   Uri.parse("http://192.168.0.101:8081/usuarios"),
   //   headers: requestHeaders,
   // );



    final responseJson = jsonDecode(fetchAlbum(credentials).);


    return fromJsonList(responseJson);
  }
   */

  /*

  Future<http.Response> fetchAlbum(String credentials) {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic' + credentials
    };
    
    return http.get(Uri.parse('https://192.168.0.101:8081/usuarios'), headers: requestHeaders);
  }

  Future<User> fetchUser(String encodedCredentials) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic' + encodedCredentials,
    };
    final response = await http
        .get(Uri.parse('http://192.168.0.101:8081/clientes/1'), headers: requestHeaders);


  }


   */

  Future fetchUser(String encodedCredentials) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic ' + encodedCredentials,
    };
    var url = 'http://192.168.0.101:8081/clientes';
    var response = await http.get(Uri.parse(url), headers: requestHeaders);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  User fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
        username: json['username'],
        priv: json['priv']
    );
  }

  List<User> fromJsonList(String response){
    print("Convertendo JsonList");
    return json.decode(response)['results']
        .map((data) => fromJson(data))
        .toList();
  }

}



