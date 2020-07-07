import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products_create.dart';

class ProductsList extends StatelessWidget {
  final List<Map<String, dynamic>> _products;
  final Function editProduct;
  final Function deleteProduct;
  ProductsList(this._products, this.editProduct, this.deleteProduct);
  Widget _buildEditButton(BuildContext context,index){
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return ProductsCreate(
                  products: _products[index],
                  editProduct: editProduct,
                  productIndex: index);
            }));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                deleteProduct(index);
              } else if (direction == DismissDirection.startToEnd) {
                print("o");
              }
            },
            key: Key(_products[index]['titleValue']),
            background: Container(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(_products[index]["imageUrl"])),
                  title: Text(_products[index]["titleValue"]),
                  subtitle:
                      Text('\$${_products[index]["priceValue"].toString()}'),
                  trailing: _buildEditButton(context, index)
                ),
                Divider(),
              ],
            ),
          );
        },
        itemCount: _products.length,
      ),
    );
  }
}
