

import 'package:flutter/material.dart';
 class ProductControl extends StatelessWidget{
   final Function addProduct;
   ProductControl(this.addProduct);
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        onPressed: () {
          addProduct({"title":"Confirm","imageUrl":"images/nighttime.jpg"});
        },
        color: Colors.green,
        child: Text("Shop Online..."),
      ),
    );
  }
 }