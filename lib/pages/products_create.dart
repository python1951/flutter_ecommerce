import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCreate extends StatefulWidget {
  final Function addProduct;

  ProductsCreate(this.addProduct);
  @override
  _ProductsCreateState createState() => _ProductsCreateState();
}

class _ProductsCreateState extends State<ProductsCreate> {
  String titleValue = '';
  String description = '';
  double priceValue = 0.0;
  final Map<String,dynamic> _formData = {
    "titleValue":null,
    "description":null,
    "priceValue":null,
    "imageUrl": 'images/nighttime.jpg',
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildTitleTextField(){
    return  TextFormField(
      decoration: InputDecoration(labelText: ("Title")),
      autovalidate: true,
      validator: (value){
        if (value.isEmpty || value.length<5){
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
  Widget _buildDescriptionTextField(){
    return TextFormField(
      decoration: InputDecoration(labelText: ("Description")),
      autovalidate: true,
      validator: (value){
        if (value.isEmpty || value.length<10){
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
  Widget _buildPriceTextField(){

    return  TextFormField(
      decoration: InputDecoration(labelText: ("Price")),
    autovalidate: true,
      validator: ( value){

        if (value.isEmpty || !RegExp(r'^[0-9]*$').hasMatch(value)){
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
   void _buildSubmitForm(){
 //    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     if(!_formKey.currentState.validate()){
//       return;
//     }
//
     _formKey.currentState.save();


    widget.addProduct(_formData);

     Navigator.pushNamed(context, '/products');

  }

  @override
  Widget build(BuildContext context) {
//    final double deviceWidth = MediaQuery.of(context).size.width;
//    final double targetWidth = deviceWidth>550?500:0.9*deviceWidth;
//    final double targetPadding = targetWidth - deviceWidth;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        margin: EdgeInsets.all(15),
        child: Form(
          child: ListView(
            key: _formKey,
//        padding: EdgeInsets.symmetric(horizontal: ),
            children: <Widget>[
             Form(child: _buildTitleTextField()),
            Form(child: _buildDescriptionTextField()),
            Form(child:_buildPriceTextField()),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Save"),
                color: Colors.purple,
                textColor: Colors.white,
                onPressed:_buildSubmitForm,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
