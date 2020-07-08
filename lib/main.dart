import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/product_admin.dart';
import 'package:fluttercoursee/pages/products.dart';
import './pages/products.dart';
import './pages/auth.dart';
import './widgets/products/products.dart';
import './pages/product.dart';
//import './pages/products.dart';
import './models/product.dart' ;

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <Product> _products = [];
  void addProduct(Product product){
    setState(() {

      _products.add(product);
    });
  }
  void editProduct( index,Product product){
    setState(() {
      _products[index]=product;
    });
  }
  void deleteProduct (int index){
    setState(() {
      _products.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.purple,
      ),
//      home: Auth(),
      routes: {
        '/products':(BuildContext context)=>ProductsPage(_products),
        '/':(BuildContext context) => Auth(),
        '/admin':(BuildContext context)=>ProductAdmin(addProduct,deleteProduct,_products,editProduct),
      },
      //home:Auth(),
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0]==''){
          return  null;
        }
        if (pathElements[1] == 'product'){
          final index = int.parse(pathElements[2]);
          return  MaterialPageRoute<bool>(
            builder: (BuildContext context)=>ProductCheck(_products[index].image,_products[index].title,_products[index].price.toString(),_products[index].description),
          );

        }
        return null;


      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute<bool>(builder: (BuildContext context)=>ProductsPage(_products)
        );
      },



    );

  }
}


