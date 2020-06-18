import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget{
  final List <Map<String,dynamic>> _products;
//  final Function _addProduct;
//  final Function _deleteProduct;
  ProductManager(this._products);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children:
      [
        Container(
          margin: EdgeInsets.all(15.0),
//          child: ProductControl(_addProduct),

        ),

        Expanded(child: Products(_products)
          ,)
      ],
    );
  }
}
