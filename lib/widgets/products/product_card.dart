import 'package:flutter/material.dart';
import 'package:fluttercoursee/widgets/products/address_tag.dart';
import 'package:fluttercoursee/widgets/ui_elements/title_default.dart';
import 'price_tag.dart';
import 'address_tag.dart';
import  '../ui_elements/title_default.dart';
import '../../pages/product.dart';
import 'products.dart';
class ProductCard extends StatelessWidget{
  final Map<String,dynamic> product;
  final int productIndex;
  ProductCard(this.product,this.productIndex);

  Widget _buildTitlePrice(){
    return Container(
     margin: EdgeInsets.only(left: 150, right: 20),
      child: Row(
        children: <Widget>[
          SizedBox(height: 1.0),
          SizedBox(
            width: 5,
          ),
          TitleDefault(product['titleValue']),
          PriceTag(product['priceValue'].toString())

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
                      Product('imageUrl', 'titleValue','priceValue',"description"))),

        ),

        IconButton(
          icon: Icon(Icons.favorite_border,color: Colors.red[500]),
          onPressed: (){},
        )


      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
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