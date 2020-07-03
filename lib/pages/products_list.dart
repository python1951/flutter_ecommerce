import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Text("List of Products"),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context,'/');
            },
            child: Text("PLease Login"),
          )

        ],
      ),
    );


  }
}
