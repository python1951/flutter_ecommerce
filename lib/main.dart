import 'package:flutter/material.dart';
import 'package:fluttercoursee/pages/product_admin.dart';
import 'package:fluttercoursee/pages/products.dart';
import 'package:fluttercoursee/scoped_models/products.dart';
import './pages/products.dart';
import './pages/auth.dart';
import './widgets/products/products.dart';
import './pages/product.dart';
//import './pages/products.dart';
import './models/product.dart' ;
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductModel>(
      model: ProductModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          brightness: Brightness.light,
          accentColor: Colors.purple,
        ),
//      home: Auth(),
        routes: {
          '/products':(BuildContext context)=>ProductsPage(),
          '/':(BuildContext context) => Auth(),
          '/admin':(BuildContext context)=>ProductAdmin(),
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
              builder: (BuildContext context)=>ProductCheck(index),
            );

          }
          return null;


        },
        onUnknownRoute: (RouteSettings settings){
          return MaterialPageRoute<bool>(builder: (BuildContext context)=>ProductsPage()
          );
        },



      ),
    );

  }
}


