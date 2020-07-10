import 'dart:async';
import 'package:flutter/material.dart';

import 'package:fluttercoursee/widgets/products/price_tag.dart';
import 'package:fluttercoursee/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';
import '../widgets/ui_elements/title_default.dart';
import '../scoped_models/main.dart';
import '../models/product.dart';

class ProductCheck extends StatelessWidget {
  final int productIndex;

  ProductCheck(
    this.productIndex,
  );

  Widget _buildAddressPriceRow(price) {
    return Container(
      margin: EdgeInsets.only(left: 7),
      child: Row(
        children: <Widget>[
          Text(
            "Round Square,Berlin,Germany",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("|"),
          ),
          PriceTag(price),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(onWillPop: () {
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Product products = model.allProducts[productIndex];
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/nighttime.jpg'),
                Text("Welcome to checkout"),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  padding: EdgeInsets.all(5),
                  child: TitleDefault(products.title),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 9, vertical: 1),
                  child: Text(
                    products.description,
                    style: TextStyle(
                      color: Colors.grey[560],
                    ),
                  ),
                ),
                _buildAddressPriceRow(products.price.toString()),
                RaisedButton(
                  child: Text("Delete"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Are you sure ?"),
                          content: Text("This cannot be undone"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Continue"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context, true);
                              },
                            ),
                            FlatButton(
                              child: Text("Discard"),
                              onPressed: () {
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
            ));
      },
    ));
  }
}
