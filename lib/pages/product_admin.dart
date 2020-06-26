import 'package:flutter/material.dart';


import './products_create.dart';
import './products_list.dart';
import './products.dart';
import'./product_admin.dart';


class ProductAdmin extends StatelessWidget{
  final Function addProduct;
  final Function deleteProduct;
  ProductAdmin(this.addProduct,this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(

     length: 2 ,
    child: Scaffold(
          drawer: Drawer(
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
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
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
        ProductsCreate(this.addProduct),
        ProductsList(),

      ],


        ),


      ),
    );
  }
}