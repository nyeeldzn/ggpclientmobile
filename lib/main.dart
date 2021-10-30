import 'package:flutter/material.dart';
import 'package:ggpmobile/Pages/home_page.dart';
import 'package:ggpmobile/Pages/login_page.dart';

void main() {
  runApp(GGPMobile());
}

class GGPMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GGP Mobile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
      }
    );
  }

}



