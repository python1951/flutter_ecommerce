import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercoursee/widgets/products/price_tag.dart';
import 'package:fluttercoursee/widgets/ui_elements/title_default.dart';
import '../widgets/ui_elements/title_default.dart';

class Product extends StatelessWidget {
  final String titleValue;
  final String imageUrl;
  final String description;
  final String priceValue;


  Product(
    this.imageUrl,
    this.titleValue,
      this.priceValue,
      this.description
  );

  Widget _buildAddressPriceRow() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "Round Square,Berlin,Germany",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text("|"),
          ),
          PriceTag(priceValue),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
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
                  child: TitleDefault(titleValue)
              ),
              _buildAddressPriceRow(),
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
          )),
    );
  }
}
