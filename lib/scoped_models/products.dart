import 'package:flutter/material.dart';
import 'package:fluttercoursee/scoped_models/connected_products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import 'connected_products.dart';

class ProductsModel extends ConnectedProducts {
  bool _showFavourites = false;

  List<Product> get allProduct {
    return List.from(products);
  }

  List<Product> get favProducts {
    if (_showFavourites) {
      return products.where((Product product) => product.isFavourite).toList();
    }
    return List.from(products);
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }

    return products[selectedProductIndex];
  }

  int get selectedProductIndex {
    return sellProducts;
  }

  void editProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: products[sellProducts].userEmail,
        userId: products[sellProducts].userId);

    products[selectedProductIndex] = updatedProduct;
    sellProducts = null;
  }

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    sellProducts = null;
  }

  void selectProduct(int index) {
    sellProducts = index;
    notifyListeners();
  }

  void toggleFavouriteIcon() {
    final bool isCurrentFavourite = products[selectedProductIndex].isFavourite;
    final bool isNewFavourite = !isCurrentFavourite;
    final Product newProduct = new Product(
      title: products[sellProducts].title,
      description: products[sellProducts].description,
      price: products[sellProducts].price,
      image: products[sellProducts].image,
      userEmail: products[sellProducts].userEmail,
      userId: products[sellProducts].userId,
      isFavourite: isNewFavourite,
    );
    products[sellProducts] = newProduct;
    sellProducts = null;
    notifyListeners();
  }

  void toggleFavouriteList() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}
