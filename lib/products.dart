import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget{
final List <String> _products;
Products(this._products);
    Widget _buildList( BuildContext context, int index){
  return Card(
    child: Column(
      children: <Widget>[
        Image.asset('images/nighttime.jpg'),
        Text(_products[index]),
      ],
    ),
  );
}
  @override
  Widget  build(BuildContext context){

    return _products.length>0?ListView.builder(


        itemBuilder: _buildList,
        itemCount: _products.length,
    ): Center(
      child: Text(
          "OOPs no Products Available"),
    );



  }

}