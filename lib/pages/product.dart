import 'package:flutter/material.dart';

class Product extends StatelessWidget{
  final title;
  final imageUrl;
  Product(this.imageUrl,this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: Text(
        title,
        style: TextStyle(
        color: Colors.red[500],
    ),
    ),
    ),
    body:Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(imageUrl),
        Text(
            "Welcome to checkout"
        ),
        SizedBox(
          height: 12.0,
        ),
        RaisedButton(
          child: Text("Go Back"),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    )
    
    );
  }
}