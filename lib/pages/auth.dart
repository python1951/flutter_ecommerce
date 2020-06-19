import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';
import './product.dart';


class Auth extends StatelessWidget {
  bool acceptTerms= true;
  String emailValue='';
  String passValue='';
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:Text("Log-in"),


        ),
        body: Container(
          margin: EdgeInsets.all(10.0),

          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),
                onChanged: (String value){
                  emailValue = value;

                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Password"
                ),
                obscureText: _obscure,
                onChanged: (String value){
                  passValue = value;

                },
              ),


            ],
          ),
        ),

      ),
    );;
  }
}


