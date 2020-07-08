import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/product.dart';
import './price_tag.dart';
import 'price_tag.dart';
import '../../models/product.dart'  ;
import 'product_card.dart';
class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);


  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: (BuildContext context,int index)=>ProductCard(products[index],index),
            itemCount: products.length,
          )
        : Center(
            child: Text("Add Products"),
          );
  }
}
