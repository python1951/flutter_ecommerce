import 'package:flutter/material.dart';


import'./product_admin.dart';
import '../product_manager.dart';

class Products extends StatelessWidget{
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
             Navigator.pushReplacement(context, MaterialPageRoute(
                 builder: (BuildContext context)=>ProductAdmin()
                ),
             );

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
        body: ProductManager()


    );
  }
}