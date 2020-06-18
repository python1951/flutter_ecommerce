import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCreate extends StatefulWidget {
  final Function addProduct;
  ProductsCreate(this.addProduct);
  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue = 'a';
  String description = 'a';
  double priceValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: ("Title")),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: ("Description")),
            onChanged: (String value) {
              setState(() {
                description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: ("Price")),
            keyboardType: TextInputType.number,
            maxLength: 3,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              Map<String, dynamic> product = {
                "title": titleValue,
                "desc": description,
                "price": priceValue,
                "image": 'images/nighttime.jpg',
              };
              widget.addProduct(product);
            },
          ),
        ],
      ),
    );
  }
}
