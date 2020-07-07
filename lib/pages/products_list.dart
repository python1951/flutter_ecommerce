import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products_create.dart';

class ProductsList extends StatelessWidget {
  final  List<Map<String,dynamic>> _products;
  final Function editProduct;
  ProductsList(this._products,this.editProduct);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(itemBuilder:(BuildContext context,int index){
        return ListTile(
          leading: Image.asset(_products[index]["imageUrl"]),
          title: Text(_products[index]["titleValue"]),
          trailing: IconButton(icon: Icon(Icons.edit),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
               return ProductsCreate(products:_products[index],editProduct: editProduct,productIndex:index);
            }));

          },),
        );
      },
      itemCount: _products.length,),

    );


  }
}
