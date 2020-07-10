import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercoursee/scoped_models/products.dart';
import '../../pages/product.dart';
import './price_tag.dart';
import 'price_tag.dart';
import '../../models/product.dart'  ;
import 'product_card.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
class Products extends StatelessWidget {


  Products();
  Widget _buildProducts(List<Product> product ){
    return product.length > 0
        ? ListView.builder(
      itemBuilder: (BuildContext context,int index)=>ProductCard(product[index],index),
      itemCount: product.length,
    )
        : Center(
      child: Text("Add Products"),
    );
  }

  @override
  Widget build(BuildContext context){

    return  ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){
      return _buildProducts(model.favProducts);
    }
    );


  }
}

