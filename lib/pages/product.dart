import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercoursee/widgets/products/price_tag.dart';

class Product extends StatelessWidget{

  final  String title;
  final String imageUrl;
  Product(this.imageUrl,this.title,);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return WillPopScope(
    onWillPop: (){
      Navigator.pop(context,false);
      return Future.value(false);
    },
      child: Scaffold(
          appBar: AppBar(
          title: Text(
          title,
          style: TextStyle(
          color: Colors.white,
      ),
      ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/nighttime.jpg'),
          Text(
              "Welcome to checkout"
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.all(5),
              child: Text("Round Square,Berlin,Germany")),
          PriceTag("89"),
          RaisedButton(
            child: Text("Delete"),
            onPressed: (){
              showDialog(context:context,builder: (BuildContext context){
               return  AlertDialog(
                title: Text("Are you sure ?"),
                 content: Text("This cannot be undone"),
                 actions: <Widget>[
                   FlatButton(
                     child: Text("Continue"),
                     onPressed: (){
                       Navigator.pop(context);
                       Navigator.pop(context,true);
                     },
                   ),
                   FlatButton(
                     child: Text("Discard"),
                     onPressed: (){
                       Navigator.pop(context);
                     },
                   )
                 ],

                );

              },
              );
            },
          )
        ],
      )

      ),
    );
  }
}