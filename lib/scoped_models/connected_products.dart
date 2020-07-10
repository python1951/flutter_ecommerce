import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductsModel extends Model {
  final List<Product> _products = [];
  User _authenticatedUser;
  int sellProducts;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        email: _authenticatedUser.email,
        id: _authenticatedUser.id);

    _products.add(newProduct);

  }
}



class ProductsModel extends ConnectedProductsModel {
  bool _showFavourites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get favProducts {
    if (_showFavourites) {
      return _products.where((Product product) => product.isFavourite).toList();
    }
    return List.from(_products);
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }

    return _products[selectedProductIndex];
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
        email: _products[selectedProductIndex].email,
        id: _products[selectedProductIndex].id);

    _products[selectedProductIndex] = updatedProduct;
;
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);

  }

  void selectProduct(int index) {
    sellProducts = index;
    notifyListeners();
  }

  void toggleFavouriteIcon() {
    final bool isCurrentFavourite = _products[selectedProductIndex].isFavourite;
    final bool isNewFavourite = !isCurrentFavourite;
    final Product newProduct = new Product(
      title: _products[sellProducts].title,
      description: _products[sellProducts].description,
      price: _products[sellProducts].price,
      image: _products[sellProducts].image,
      email: _products[sellProducts].email,
      id: _products[sellProducts].id,
      isFavourite: isNewFavourite,
    );
    _products[sellProducts] = newProduct;

    notifyListeners();
  }

  void toggleFavouriteList() {
    _showFavourites = !_showFavourites;
    notifyListeners();
  }
}
class UserModel extends ConnectedProductsModel{
  void login (email,password){
    _authenticatedUser = User(id:"89" ,email: email,password: password);
  }
}