import 'package:flutter/material.dart';
import '../widgets/products/products.dart';

import './product_admin.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {


  Widget _drawer(context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Choose"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text("Manage Products"),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text(
          "E-Commerce Store",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 20,
            ),
          ),

        ],
      ),
      body: Products(),
    );
  }
}
