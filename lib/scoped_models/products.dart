import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
class ProductsModel extends Model{
  List <Product> _products = [];
  int _selectedProductIndex;
  bool _showFavourites = false;

  List <Product> get product{
    return List.from(_products);

  }
  List <Product> get favProducts{
    if (_showFavourites){
      return _products.where((Product product) => product.isFavourite).toList();
    }
    return List.from(_products);
  }
  bool get displayFavouritesOnly{
    return _showFavourites;
  }


  Product get selectedProduct {
    if(_selectedProductIndex == null){
      return null;
    }


      _products[_selectedProductIndex];
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }
  void addProduct(Product product){


      _products.add(product);
      _selectedProductIndex = null;
      notifyListeners();

  }
  void editProduct( Product product){

      _products[_selectedProductIndex]=product;
        _selectedProductIndex = null;
        notifyListeners();
  }
  void deleteProduct (){

      _products.removeAt(_selectedProductIndex);
      _selectedProductIndex = null;
      notifyListeners();
  }
  void selectProduct(int index){

    _selectedProductIndex = index;
    notifyListeners();
  }
  void toggleFavouriteIcon(){
    final bool isCurrentFavourite = _products[selectedProductIndex].isFavourite;
    final bool isNewFavourite = !isCurrentFavourite;
    final Product newProduct = new Product(
      title: _products[selectedProductIndex].title,
      description: _products[selectedProductIndex].description,
      price: _products[selectedProductIndex].price,
      image: _products[selectedProductIndex].image,
      isFavourite: isNewFavourite,

    );
    _products[_selectedProductIndex] = newProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }
  void toggleFavouriteList(){
    _showFavourites = !_showFavourites;
    notifyListeners();
  }

}