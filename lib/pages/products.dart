import 'package:flutter/material.dart';


import'./product_admin.dart';
import '../product_manager.dart';

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
        ),
        body: ProductManager(_products)


    );
  }
}