import 'package:flutter/material.dart';
import '../ui_elements/title_default.dart';

class TitleDefault extends StatelessWidget{
  final String title;
  TitleDefault(this.title);
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return  Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Oswald",
      ),
    );
  }
}