import 'package:flutter/material.dart';
import 'products.dart';

class PriceTag extends StatelessWidget{

  final String price;
  PriceTag(this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: Text(
        '\$$price',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: "Oswald",
        ),
      ),
    );
  }
}