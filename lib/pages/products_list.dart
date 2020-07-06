import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final  List<Map<String,dynamic>> _products;
  ProductsList(this._products);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(itemBuilder:(BuildContext context,int index){
        return ListTile(
          leading: Image.asset(_products[index]["imageUrl"]),
          title: Text(_products[index]["title"]),
          trailing: IconButton(icon: Icon(Icons.edit),
          onPressed: (){

          },),
        );
      },
      itemCount: _products.length,),

    );


  }
}
