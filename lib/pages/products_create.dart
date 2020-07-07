import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCreate extends StatefulWidget {
  final Function addProduct;
  final Map<String,dynamic> products;
  final Function editProduct;
  final int productIndex;
  ProductsCreate({this.addProduct,this.products,this.editProduct,this.productIndex});
  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue = '';
  String description = '';
  double priceValue = 0.0;

  final Map<String, dynamic> _formData = {
    "titleValue": null,
    "description": null,
    "priceValue": null,
    "imageUrl": 'images/nighttime.jpg',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
    initialValue: widget.products==null?"":widget.products["titleValue"],
      decoration: InputDecoration(labelText: ("Title")),

      validator: (value) {
        if (value.isEmpty || value.length < 5) {
          return "Input Required and Title must be 5+ characters";
        }
        return null;
      },
      onSaved: (String value) {
        print("description");
        _formData["titleValue"] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
     initialValue: widget.products==null?"":widget.products["description"],
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

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue: widget.products==null?"":widget.products["priceValue"].toString(),
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
        _formData["priceValue"] = double.parse(value);
      },
    );
  }
  Widget _buildGesture(){
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        margin: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(

//        padding: EdgeInsets.symmetric(horizontal: ),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Save"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed: _buildSubmitForm,

              ),
            ],
          ),
        ),
      ),
    );
  }

  void _buildSubmitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if(widget.products==null){
      widget.addProduct(_formData);
    }
    else{
      widget.editProduct(widget.productIndex,_formData);
    }





      Navigator.pushNamed(context, '/products');

  }

  @override
  Widget build(BuildContext context) {
//    final double deviceWidth = MediaQuery.of(context).size.width;
//    final double targetWidth = deviceWidth>550?500:0.9*deviceWidth;
//    final double targetPadding = targetWidth - deviceWidth;
    final Widget pageContent = _buildGesture();
    return widget.products == null ? pageContent : Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
      ),
      body: pageContent,
    );
  }
}