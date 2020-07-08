import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
class ProductModel extends Model{
  List <Product> _products = [];

  List <Product> get product{
    return List.from(_products);
  }
  void addProduct(Product product){


      _products.add(product);

  }
  void editProduct( index,Product product){

      _products[index]=product;

  }
  void deleteProduct (int index){

      _products.removeAt(index);

  }

}