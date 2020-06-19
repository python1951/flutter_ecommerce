import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Text("List od Products"),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context,'/login');
            },
            child: Text("PLease Login"),
          )

        ],
      ),
    );


  }
}
