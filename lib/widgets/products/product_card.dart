import 'package:flutter/material.dart';
import 'price_tag.dart';

import '../../pages/product.dart';
import 'products.dart';
class ProductCard extends StatelessWidget{
  final Map<String,dynamic> product;
  final int productIndex;
  ProductCard(this.product,this.productIndex);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 150, right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  product['title'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                PriceTag(product['price'].toString())

              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.all(5),
              child: Text("Round Square,Berlin,Germany")),
          SizedBox(height: 10,),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info,color: Theme.of(context).accentColor,),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Product('imageUrl', 'title'))),

    ),

              IconButton(
                icon: Icon(Icons.favorite_border,color: Colors.red[500]),
                onPressed: (){},
              )


            ],
          )
        ],
      ),
    );;
  }
}