import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/home.dart';
import './pages/home.dart';

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
      home:HomePage(),
      );

  }
}
