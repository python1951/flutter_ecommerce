import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';
import './pages/products.dart';
import './pages/auth.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.purple,
      ),
      home:Auth(),
      );

  }
}
