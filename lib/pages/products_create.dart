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
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _buildTitleTextField(){
    return  TextFormField(
      decoration: InputDecoration(labelText: ("Title")),
      onSaved: (String value) {
        setState(() {
          titleValue = value;
        });
      },
    );
  }
  Widget _buildDescriptionTextField(){
    return TextFormField(
      decoration: InputDecoration(labelText: ("Description")),
      onSaved: (String value) {
        setState(() {
          description = value;
        });
      },
    );
  }
  Widget _buildPriceTextField(){
    return  TextFormField(
      decoration: InputDecoration(labelText: ("Price")),
      keyboardType: TextInputType.number,
      maxLength: 3,
      onSaved: (String value) {
        setState(() {
          priceValue = double.parse(value);
        });
      },
    );
  }
  void _buildsumbitform(){
    _formkey.currentState.save();
    Navigator.pushNamed(context, '/products');
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
//    final double deviceWidth = MediaQuery.of(context).size.width;
//    final double targetWidth = deviceWidth>550?500:0.9*deviceWidth;
//    final double targetPadding = targetWidth - deviceWidth;
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      margin: EdgeInsets.all(15),
      child: Form(
        child: ListView(
          key: _formkey,
//        padding: EdgeInsets.symmetric(horizontal: ),
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
      ),
    );
  }
}
