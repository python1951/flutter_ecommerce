import 'package:flutter/material.dart';

import '../scoped_models/main.dart';
import './products_create.dart';
import './products_list.dart';
import './products.dart';
import'./product_admin.dart';
import '../models/product.dart';
class ProductAdmin extends StatelessWidget{


  Widget _buildDrawer(context){
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Choose"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("All Products"),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(

     length: 2 ,
    child: Scaffold(
          drawer: _buildDrawer(context),
          appBar: AppBar(

            title: Text(
              "Manage Products",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.create),
                  text: "Create Products",),
                Tab(icon: Icon(Icons.view_list),
                  text: "View Products",)
              ],
            ),
          ),
        body:TabBarView(
      children: <Widget>[
        ProductsCreate(),
        ProductsList(),

      ],


        ),


      ),
    );
  }
}