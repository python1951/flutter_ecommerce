import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/product.dart';
import '../scoped_models/main.dart';
import '../scoped_models/products.dart';
class ProductsCreate extends StatefulWidget {

  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue = '';
  String description = '';
  double priceValue = 0.0;

  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "price": null,
    "image": 'images/nighttime.jpg',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? "" : product.title,
      decoration: InputDecoration(labelText: ("Title")),
      validator: (value) {
        if (value.isEmpty || value.length < 4) {
          return "Input Required and Title must be 5+ characters";
        }
        return null;
      },
      onSaved: (String value) {
        print("description");
        _formData["title"] = value;
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      initialValue: product == null ? "" : product.description,
      decoration: InputDecoration(labelText: ("Description")),
      validator: (value) {
        if (value.isEmpty || value.length < 10) {
          return "Input Required and Description must be 10+ characters";
        }
        return null;
      },
      onSaved: (String value) {
        print("description");
        _formData["description"] = value;
      },
    );
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      initialValue:
          product == null ? "" : product.price.toString(),
      decoration: InputDecoration(labelText: ("Price")),
      validator: (value) {
        if (value.isEmpty || !RegExp(r'^[0-9]*$').hasMatch(value)) {
          return 'Input Required and must be number';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      maxLength: 5,
      onSaved: (String value) {
        print("description");
        _formData["price"] = double.parse(value);
      },
    );
  }

  Widget _buildPageContent(BuildContext context,Product product) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
//        padding: EdgeInsets.symmetric(horizontal: ),
            children: <Widget>[
              _buildTitleTextField(product),
              _buildDescriptionTextField(product),
              _buildPriceTextField(product),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _buildSubmitForm(Function addProduct, Function editProduct,int selectedProductIndex) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedProductIndex == null) {
      addProduct(Product(
        title: _formData['title'],
        description: _formData["description"],
        price: _formData['price'],
        image: _formData['image'],
      ));
    } else {
      editProduct(

          Product(
            title: _formData['title'],
            description: _formData["description"],
            price: _formData['price'],
            image: _formData['image'],
          ));
    }

    Navigator.pushNamed(context, '/products');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return RaisedButton(
        child: Text("Save"),
        color: Colors.purple,
        textColor: Colors.white,
        onPressed: () => _buildSubmitForm(model.addProduct, model.editProduct,model.selectedProductIndex),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
//    final double deviceWidth = MediaQuery.of(context).size.width;
//    final double targetWidth = deviceWidth>550?500:0.9*deviceWidth;
//    final double targetPadding = targetWidth - deviceWidth;

    return ScopedModelDescendant<MainModel>(builder: (BuildContext context,Widget child,MainModel model){
      final Widget pageContent = _buildPageContent(context,model.selectedProduct);
      return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
        appBar: AppBar(
          title: Text("Edit Product"),
        ),
        body: pageContent,
      );
    },);
  }
}
