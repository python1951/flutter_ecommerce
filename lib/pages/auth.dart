import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';
import './product.dart';
class Auth extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text("Log-in")

        ),
      body: Center(
        child: RaisedButton(
          child: Text("Log in"),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) =>Products()
            ),);
          },
        ),
      ),
      ),
    );
  }
}