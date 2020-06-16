import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductsCreate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child:RaisedButton(
      child: Text("Save"),
      onPressed: (){
        showModalBottomSheet(context: context, builder: (BuildContext context){

          return Text("Saved!",);
        },
        );
      },
    ));
  }
}