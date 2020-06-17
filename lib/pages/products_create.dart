import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProductsCreate extends StatefulWidget {
  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue='';
  String addnumber='';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String value){
            setState(() {
              titleValue = value;
            });
          },
        ),
        Text(titleValue),
        TextField(
          keyboardType: TextInputType.multiline,

        ),
        TextField(
            keyboardType: TextInputType.number,
          onChanged: (String number){
              setState(() {
               addnumber = number;
              });
              Text(addnumber);

          },
        ),
      ],
    );
  }
}
