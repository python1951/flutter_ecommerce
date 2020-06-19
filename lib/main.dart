import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/product_admin.dart';
import 'package:fluttercoursee/pages/products.dart';
import './pages/products.dart';
import './pages/auth.dart';
import './products.dart';
import './pages/product.dart';
import './pages/products.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <Map<String,dynamic>> _products = [];
  void addProduct(Map <String,dynamic>product){
    setState(() {

      _products.add(product);
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
      routes: {
        '/':(BuildContext context)=>ProductsPage(_products),
        '/login':(BuildContext context) => Auth(),
        '/admin':(BuildContext context)=>ProductAdmin(addProduct,deleteProduct),
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
            builder: (BuildContext context)=>Product(_products[index]['imageUrl'],_products[index]['title']),
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


