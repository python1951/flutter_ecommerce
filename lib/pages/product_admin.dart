import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products.dart';

import './product.dart';
import '../product_manager.dart';

class ProductAdmin extends StatelessWidget{
  ProductAdmin();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
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
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)=>Products()
                    ),
                    );
                  },
                ),
             ],
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Create Products",),
                Tab(text: "My Products",)
              ],
            ),
            title: Text(
              "E-Commerce Store",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: Text("Welcome"),


      ),
    );
  }
}