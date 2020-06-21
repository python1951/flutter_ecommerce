import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);
  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(left: 150,right: 20),
            child: Row(
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald",
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 3,vertical: 2),
                  child:
                Text(
                 '\$${ products[index]['price'].toString()}',
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Oswald",
                ),),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Product('imageUrl', 'title'))),
                child: Text("Confirm your Order "),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildList,
            itemCount: products.length,
          )
        : Center(
            child: Text("OOPs no Products Available"),
          );
  }
}
