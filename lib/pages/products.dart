import 'package:flutter/material.dart';
import '../widgets/products/products.dart';

import'./product_admin.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget{
  final List<Map<String,dynamic>> _products ;
//  final Function addProduct;
//  final Function deleteProduct;
  ProductsPage(this._products);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Choose"),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text("Manage Products"),
              onTap: (){
             Navigator.pushReplacementNamed(context, '/admin');

              },
            ),
          ],
        ),
      ),
        appBar: AppBar(

          title: Text(
            "E-Commerce Store",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[

            IconButton(
              icon: Icon(Icons.favorite,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
        body: Products(_products)


    );
  }
}