import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
class UserModel extends Model{
  User _authenticatedUser;
  void login (email,password){
    _authenticatedUser = User(id:89 ,email: email,password: password);
  }
}