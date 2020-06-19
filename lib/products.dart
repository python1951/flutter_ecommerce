import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget{
final List <Map<String,dynamic>> products;

Products(this.products );
    Widget _buildList( BuildContext context, int index){
  return Card(
    child: Column(

      children: <Widget>[
      Image.asset(products[index]['imageUrl']),
        Text(products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[

           RaisedButton(

             onPressed: ()=>
               Navigator.pushReplacement(context, MaterialPageRoute(
                 builder: (BuildContext context) => Product('imageUrl','title')
  )

               ),


             child: Text("Confirm your Order "),
           )
          ],
        )
      ],
    ),
  );
}
  @override
  Widget  build(BuildContext context){

    return products.length>0?ListView.builder(


        itemBuilder: _buildList,
        itemCount: products.length,
    ): Center(
      child: Text(
          "OOPs no Products Available"),
    );



  }

}