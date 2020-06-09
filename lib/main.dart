import 'package:flutter/material.dart';

import './product_manager.dart';
void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  List<String> _products = ["Time Teaser"];
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
          title: Text(
            "E-Commerce Store",
            style: TextStyle(
              color: Colors.red[500],
            ),
          ),
        ),
        body: ProductManager("Raat Sharabi")


        ),
      );

  }
}
