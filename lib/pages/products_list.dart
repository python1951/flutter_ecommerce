import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/products_create.dart';
import '../models/product.dart';
import '../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsList extends StatelessWidget {

  Widget _buildEditButton(BuildContext context,index,MainModel model){


      return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          model.selectProduct(index);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ProductsCreate();
              }));
        },
      );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(builder :(BuildContext context ,Widget child, MainModel model){
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                model.selectProduct(index);
                model.deleteProduct();
              } else if (direction == DismissDirection.startToEnd) {
                print("o");
              }
            },
            key: Key(model.allProducts[index].title),
            background: Container(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                        AssetImage(model.allProducts[index].image)),
                    title: Text(model.allProducts[index].title),
                    subtitle:
                    Text('\$${model.allProducts[index].price.toString()}'),
                    trailing: _buildEditButton(context, index,model)
                ),
                Divider(),
              ],
            ),
          );
        },
        itemCount: model.allProducts.length,
      );
    });
  }
}
