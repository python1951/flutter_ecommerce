import 'package:flutter/material.dart';
import 'package:fluttercoursee/product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
    final Map <String,String>startingProduct;
  ProductManager({this.startingProduct});
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String,String>> _products = [];
  void initState(){
    if(widget.startingProduct!= null) {
      _products.add(widget.startingProduct);
    }
  super.initState();
  }
  void _addProduct(Map <String,String>product){
    setState(() {

      _products.add(product);
    });
  }
  void _deleteProduct (int index){
    setState(() {
      _products.removeAt(index);
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

        Expanded(child: Products(_products,deleteProduct:_deleteProduct)
          ,)
      ],
    );
  }
}
