import 'package:flutter/material.dart';


import './products_create.dart';
import './products_list.dart';
import './products.dart';
import'./product_admin.dart';
import '../product_manager.dart';

class ProductAdmin extends StatelessWidget{
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
                  title: Text("All Products"),
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (BuildContext context)=>Products()

                    ),
                    );

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
        ProductsCreate(),
        ProductsList()

      ],


        ),


      ),
    );
  }
}