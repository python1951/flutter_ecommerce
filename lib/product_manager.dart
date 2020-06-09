import 'package:flutter/material.dart';
import 'package:fluttercoursee/product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
    final String startingProduct;
  ProductManager(this.startingProduct);
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  void initState(){
    if(widget.startingProduct!= null) {
      _products.add(widget.startingProduct);
    }
  super.initState();
  }
  void _addProduct(String product){
    setState(() {

      _products.add(product);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Container(
          margin: EdgeInsets.all(15.0),
          child: ProductControl(_addProduct),

        ),

        Expanded(child: Products(_products),)
      ],
    );
  }
}
