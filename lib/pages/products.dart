import 'package:flutter/material.dart';
import '../widgets/products/products.dart';
import '../models/product.dart';
import './product_admin.dart';
import '../scoped_models/main.dart';
import '../widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/products.dart';
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
         ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){return IconButton(
           icon: Icon(model.displayFavouritesOnly?

             Icons.favorite:Icons.favorite_border,
             color: Colors.white,
             size: 20,

           ),
           onPressed: (){
          model.toggleFavouriteList();

           },
         );
         },)

        ],
      ),
      body: Products(),
    );
  }
}
