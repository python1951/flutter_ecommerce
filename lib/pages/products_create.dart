import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCreate extends StatefulWidget {
  final Function addProduct;
  ProductsCreate(this.addProduct);
  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue = '';
  String description = '';
  double priceValue = 0.0;
  Widget _buildTitleTextField(){
    return  TextField(
      decoration: InputDecoration(labelText: ("Title")),
      onChanged: (String value) {
        setState(() {
          titleValue = value;
        });
      },
    );
  }
  Widget _buildDescriptionTextField(){
    return TextField(
      decoration: InputDecoration(labelText: ("Description")),
      onChanged: (String value) {
        setState(() {
          description = value;
        });
      },
    );
  }
  Widget _buildPriceTextField(){
    return  TextField(
      decoration: InputDecoration(labelText: ("Price")),
      keyboardType: TextInputType.number,
      maxLength: 3,
      onChanged: (String value) {
        setState(() {
          priceValue = double.parse(value);
        });
      },
    );
  }
  void _buildsumbitform(){
    Navigator.pushNamed(context, '/');
    Map<String, dynamic> product = {
      "title": titleValue,
      "desc": description,
      "price": priceValue,
      "imageUrl": 'images/nighttime.jpg',
    };
    widget.addProduct(product);


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
         _buildTitleTextField(),
        _buildDescriptionTextField(),
        _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text("Save"),
            color: Colors.purple,
            textColor: Colors.white,
            onPressed:_buildsumbitform,

          ),
        ],
      ),
    );
  }
}
