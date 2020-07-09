import 'package:flutter/material.dart';
import 'package:fluttercoursee/scoped_models/products.dart';
import 'package:fluttercoursee/widgets/products/address_tag.dart';
import 'package:fluttercoursee/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import 'price_tag.dart';
import 'address_tag.dart';
import '../../scoped_models/main.dart';
import  '../ui_elements/title_default.dart';
import '../../pages/product.dart';
import 'products.dart';
import '../../models/product.dart';
class ProductCard extends StatelessWidget{
  final Product product;
  final int productIndex;
  ProductCard(this.product,this.productIndex);

  Widget _buildTitlePrice(){
    return Container(
     margin: EdgeInsets.only(left: 150, right: 20),
      child: Row(
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(width: 9,),
          PriceTag(product.price.toString())

        ],
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context){
    return  ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info,color: Theme.of(context).accentColor,),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductCheck(productIndex))),

        ),

        ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){
          return IconButton(
            icon: Icon(model.product[productIndex].isFavourite?Icons.favorite:Icons.favorite_border,color: Colors.red[500],),
            onPressed: (){
              model.selectProduct(productIndex);
              model.toggleFavouriteIcon();
            },
          );
        },)


      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          SizedBox(height: 10),
          _buildTitlePrice(),
          AddressTag("Round Square,Berlin,Germany"),
          SizedBox(height: 10,),
         _buildButtonBar(context),
        ],
      ),
    );
  }
}