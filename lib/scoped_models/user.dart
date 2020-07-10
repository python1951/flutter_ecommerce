import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'connected_products.dart';
class UserModel extends ConnectedProducts{
  void login (email,password){
    authenticatedUser = User(id:"89" ,email: email,password: password);
  }
}