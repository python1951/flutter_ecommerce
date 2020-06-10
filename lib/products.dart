import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget{
final List <Map<String,String>> _products;
Products([this._products = const []]);
    Widget _buildList( BuildContext context, int index){
  return Card(
    child: Column(
      children: <Widget>[
        Image.asset(_products[index]['imageUrl']),
        Text(_products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[

           RaisedButton(
             onPressed: ()=>
               Navigator.push(context, MaterialPageRoute(
                 builder: ( BuildContext context)=>Product(_products[index]['imageUrl'],_products[index]['title'])
               ),

  ),child: Text("Confirm your Order"),
           )
          ],
        )
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